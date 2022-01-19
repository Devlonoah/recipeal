import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipeal/core/error/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> signWithGoogle();

  Future<Either<Failure, GoogleSignInAccount>> signOut();

  Future<bool> isSignedIn();

  Future<Either<Failure, User>> getUser();
}
