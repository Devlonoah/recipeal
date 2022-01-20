import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeal/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:recipeal/presentation/bloc/user/user_cubit.dart';
import 'package:recipeal/presentation/tab_manager/tab_manager.dart';
import 'package:recipeal/presentation/welcome/welcome.dart';

class LandingPage extends StatelessWidget {
  static String id = "LandingPage";
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LandingPageBody();
  }
}

class LandingPageBody extends StatelessWidget {
  const LandingPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(listener: (context, state) {
      if (state is UserLoaded) {
        print('adding fetch favorote recipe event from the ui');
        BlocProvider.of<FavoriteBloc>(context).add(FavoriteFetched());
      }
    }, builder: (context, state) {
      if (state is UserInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is UserLoaded) {
        return const TabManager();
      }
      if (state is UserFailed) {
        return const Welcome();
      }

      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
