import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipeal/domain/usecases/get_trending_recipe.dart';
import 'package:recipeal/domain/usecases/get_user_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.usecase) : super(UserInitial());

  final GetUserUsecase usecase;

  void getUser() async {
    final _eitherUserResult = await usecase.call(const NoParams());

    _eitherUserResult.fold(
      (l) => emit(UserFailed()),
      (r) => emit(UserLoaded(r)),
    );
  }

  void clearUser() async {
    emit(UserFailed());
  }
}
