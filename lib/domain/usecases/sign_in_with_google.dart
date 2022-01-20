import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/error/failure.dart';
import '../../core/usecases/base_usecase.dart';
import '../repository/authentication_repository.dart';
import 'get_trending_recipe.dart';

class SignInWithGoogleUsecase implements BaseUsecase<User, NoParams> {
  final AuthenticationRepository authenticationRepository;

  SignInWithGoogleUsecase(this.authenticationRepository);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return authenticationRepository.signWithGoogle();
  }
}
