import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipeal/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:recipeal/core/usecases/base_usecase.dart';
import 'package:recipeal/domain/repository/authentication_repository.dart';
import 'package:recipeal/domain/usecases/get_trending_recipe.dart';

class SignOutUsecase implements BaseUsecase<GoogleSignInAccount, NoParams> {
  final AuthenticationRepository authenticationRepository;

  SignOutUsecase(this.authenticationRepository);
  @override
  Future<Either<Failure, GoogleSignInAccount>> call(params) async {
    return authenticationRepository.signOut();
  }
}
