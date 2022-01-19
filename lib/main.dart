import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeal/bloc_observer.dart';
import 'package:recipeal/presentation/bloc/authentication/authentication_cubit.dart';
import 'package:recipeal/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:recipeal/presentation/bloc/trending_recipe/trending_recipe_bloc.dart';
import 'package:recipeal/presentation/bloc/user/user_cubit.dart';
import 'package:recipeal/presentation/landing_page/landing_page.dart';
import 'package:recipeal/presentation/search/search.dart';
import 'package:recipeal/presentation/tab_manager/tab_manager.dart';
import 'core/di/injection.dart';
import 'presentation/discover/discover.dart';
import 'presentation/recipe_info/recipe_info.dart';
import 'presentation/welcome/welcome.dart';

import 'theme/theme.dart';

void main() async {
  BlocOverrides.runZoned(
    () {},
    blocObserver: SimpleBlocObserver(),
  );
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<TrendingRecipeBloc>()),
        BlocProvider(
            lazy: false, create: (context) => getIt<UserCubit>()..getUser()),
        BlocProvider(
            lazy: false, create: (context) => getIt<AuthenticationCubit>()),
        BlocProvider(
          create: (context) => getIt<FavoriteBloc>(),
        )
      ],
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationFailure) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: const Text('Error Signing in'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Close'),
                      )
                    ],
                  );
                });
          }
          // TODO: implement listener
        },
        child: MaterialApp(
          title: 'Recipeal',
          debugShowCheckedModeBanner: false,
          routes: {
            Welcome.id: (context) => const Welcome(),
            DiscoverPage.id: (context) => const DiscoverPage(),
            RecipeInfo.id: (context) => const RecipeInfo(),
            TabManager.id: (context) => const TabManager(),
            SearchPage.id: (context) => const SearchPage(),
            LandingPage.id: (context) => const LandingPage()
          },
          initialRoute: LandingPage.id,
          theme: lightTheme,
        ),
      ),
    );
  }
}
