import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeal/bloc_observer.dart';
import 'package:recipeal/presentation/bloc/trending_recipe/trending_recipe_bloc.dart';
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
      ],
      child: MaterialApp(
        title: 'Recipeal',
        routes: {
          Welcome.id: (context) => const Welcome(),
          DiscoverPage.id: (context) => const DiscoverPage(),
          RecipeInfo.id: (context) => const RecipeInfo(),
        },
        initialRoute: Welcome.id,
        theme: lightTheme,
      ),
    );
  }
}
