import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeal/presentation/web_view/web_view.dart';
import 'package:recipeal/utils/dialogs.dart';
import 'bloc_observer.dart';
import 'presentation/bloc/authentication/authentication_cubit.dart';
import 'presentation/bloc/favorite/favorite_bloc.dart';
import 'presentation/bloc/recommended_recipe/recommended_recipe_bloc.dart';
import 'presentation/bloc/tab_manager/tabmanager_bloc.dart';
import 'presentation/bloc/trending_recipe/trending_recipe_bloc.dart';
import 'presentation/bloc/user/user_cubit.dart';
import 'presentation/landing_page/landing_page.dart';
import 'presentation/search/search.dart';
import 'presentation/tab_manager/tab_manager.dart';
import 'core/di/injection.dart';
import 'presentation/discover/discover.dart';
import 'presentation/recipe_info/recipe_info.dart';
import 'presentation/welcome/welcome.dart';

import 'theme/theme.dart';

import 'package:bloc/bloc.dart';

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
        BlocProvider(create: (context) => getIt<RecommendedRecipeBloc>()),
        BlocProvider(
            lazy: false, create: (context) => getIt<UserCubit>()..getUser()),
        BlocProvider(
            lazy: false, create: (context) => getIt<AuthenticationCubit>()),
        BlocProvider(
          create: (context) => getIt<FavoriteBloc>(),
        ),
        BlocProvider(create: (context) => TabManagerBloc())
      ],
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationFailure) {
            showFailedAuthDialog(context);
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
            AppStart.id: (context) => const AppStart(),
            WebViewPage.id: (context) => const WebViewPage()
          },
          initialRoute: AppStart.id,
          theme: lightTheme,
        ),
      ),
    );
  }
}
