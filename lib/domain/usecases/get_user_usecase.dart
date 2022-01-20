import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../core/usecases/base_usecase.dart';
import '../repository/authentication_repository.dart';
import 'get_trending_recipe.dart';

class GetUserUsecase implements BaseUsecase<User, NoParams> {
  final AuthenticationRepository repository;

  GetUserUsecase(this.repository);
  @override
  Future<Either<Failure, User>> call(NoParams noParams) async {
    return await repository.getUser();
  }
}
