import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipeal/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:recipeal/core/usecases/base_usecase.dart';
import 'package:recipeal/domain/repository/authentication_repository.dart';
import 'package:recipeal/domain/usecases/get_trending_recipe.dart';

class GetUserUsecase implements BaseUsecase<User, NoParams> {
  final AuthenticationRepository repository;

  GetUserUsecase(this.repository);
  @override
  Future<Either<Failure, User>> call(NoParams noParams) async {
    return await repository.getUser();
  }
}
