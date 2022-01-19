import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipeal/core/error/failure.dart';
import 'package:recipeal/core/usecases/base_usecase.dart';
import 'package:recipeal/domain/repository/authentication_repository.dart';
import 'package:recipeal/domain/usecases/get_trending_recipe.dart';

class SignInWithGoogleUsecase implements BaseUsecase<User, NoParams> {
  final AuthenticationRepository authenticationRepository;

  SignInWithGoogleUsecase(this.authenticationRepository);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return authenticationRepository.signWithGoogle();
  }
}
