import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../domain/usecases/get_trending_recipe.dart';

import '../../../domain/usecases/sign_in_with_google.dart';
import '../../../domain/usecases/sign_out.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    required this.signInWithGoogleUsecase,
    required this.signOutUsecase,
  }) : super(AuthenticationInitial());

  final SignInWithGoogleUsecase signInWithGoogleUsecase;
  final SignOutUsecase signOutUsecase;

  void signInWithGoogle() async {
    final _eitherResult = await signInWithGoogleUsecase.call(const NoParams());

    _eitherResult.fold(
      (l) {
        emit(AuthenticationFailure());
        emit(const AuthenticationLoggedOut());
      },
      (r) => emit(AuthenticationSuccessful(r)),
    );
  }

  void signOut() async {
    final _eitherResult = await signOutUsecase.call(const NoParams());

    _eitherResult.fold((l) {
      emit(const AuthenticationLoggedOut());
    }, (r) => emit(const AuthenticationLoggedOut()));
  }
}
