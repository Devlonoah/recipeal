import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipeal/core/error/failure.dart';
import 'package:recipeal/data/models/favorite_recipe_model_for_db.dart';
import 'package:recipeal/domain/repository/firestore_repository.dart';

class FirestoreRepositoryImpl implements FirestoreRepository {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  FirestoreRepositoryImpl({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

//Create

  @override
  Future<Either<Failure, void>> addToFavourites({
    required int id,
    required String title,
    required String image,
  }) async {
    try {
      final currentUser = firebaseAuth.currentUser?.uid;

      if (currentUser != null) {
        var data = {
          'id': id,
          'title': title,
          'image': image,
        };
        final result = await firebaseFirestore
            .collection('favorites')
            .doc('${firebaseAuth.currentUser?.uid}')
            .collection('recipe')
            .add(data);

        return Right(result);
      } else {
        return Left(AuthFailure());
      }
    } catch (e) {
      print('exception thrwon :$e');
      return Left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, List<FavoriteRecipeModelForDb>>>
      readFavourites() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapShot =
          await firebaseFirestore
              .collection('favorites')
              .doc('${firebaseAuth.currentUser?.uid}')
              .collection('recipe')
              .get();

      var list = <FavoriteRecipeModelForDb>[];

      for (var docS in querySnapShot.docs) {
        var _mapifiedDocSnapshot = docS.data();

        list.add(FavoriteRecipeModelForDb.fromMap(_mapifiedDocSnapshot));
      }

      return Right(list);
    } catch (e) {
      return Left(GeneralFailure());
    }
  }
}
