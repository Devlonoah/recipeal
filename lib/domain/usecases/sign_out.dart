import 'package:google_sign_in/google_sign_in.dart';
import '../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../core/usecases/base_usecase.dart';
import '../repository/authentication_repository.dart';
import 'get_trending_recipe.dart';

class SignOutUsecase implements BaseUsecase<GoogleSignInAccount, NoParams> {
  final AuthenticationRepository authenticationRepository;

  SignOutUsecase(this.authenticationRepository);
  @override
  Future<Either<Failure, GoogleSignInAccount>> call(params) async {
    return authenticationRepository.signOut();
  }
}
