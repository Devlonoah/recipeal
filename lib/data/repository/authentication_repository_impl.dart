import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../core/error/failure.dart';
import '../../domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;

  AuthenticationRepositoryImpl({
    required this.googleSignIn,
    required this.firebaseAuth,
  });
  @override
  Future<Either<Failure, User>> signWithGoogle() async {
    try {
      final _user = await googleSignIn.signIn();

      if (_user != null) {
        final GoogleSignInAuthentication googleAuth =
            await _user.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

        await firebaseAuth.signInWithCredential(credential);

        return Right(firebaseAuth.currentUser!);
      } else {
        return Left(AuthFailure());
      }
    } catch (e) {
      return Left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, GoogleSignInAccount>> signOut() async {
    final userReturned = await googleSignIn.signOut();
    await firebaseAuth.signOut();

    return Right(userReturned!);
  }

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      final _user = await firebaseAuth.currentUser;

      if (_user != null) {
        return Right(_user);
      } else {
        return Left(NoUserFailure());
      }
    } catch (e) {
      return Left(GeneralFailure());
    }
  }

  @override
  Future<bool> isSignedIn() async {
    final currentUser = firebaseAuth.currentUser;

    return currentUser != null;
  }
}
