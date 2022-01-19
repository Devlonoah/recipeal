part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccessful extends AuthenticationState {
  final User user;

  const AuthenticationSuccessful(this.user);

  @override
  List<Object> get props => [user];
}

class AuthenticationFailure extends AuthenticationState {}

class AuthenticationLoggedOut extends AuthenticationState {
  final GoogleSignInAccount? googleSignInAccount;

  const AuthenticationLoggedOut({this.googleSignInAccount});
}
