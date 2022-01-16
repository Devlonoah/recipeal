import 'package:get_it/get_it.dart';
import '../../data/data_source/recipe_local_data_source.dart';
import '../../data/data_source/recipe_remote_data_source.dart';
import '../../data/repository/recipe_repository_impl.dart';
import '../../domain/repository/recipe_repository.dart';
import '../../domain/usecases/get_recipe_details.dart';
import '../../domain/usecases/get_trending_recipe.dart';
import '../../presentation/bloc/recipe_details/recipe_details_bloc.dart';
import '../../presentation/bloc/trending_recipe/trending_recipe_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http_client;

GetIt getIt = GetIt.instance;

Future<void> initInjection() async {
  final sharedPreference = await SharedPreferences.getInstance();
  final client = http_client.Client();
//apiclient

  getIt.registerLazySingleton(() => client);
  // Remote data source
  getIt.registerLazySingleton<RecipeRemoteDataSource>(
      () => RecipeRemoteDataSourceImpl(client: getIt()));
  // Local data source
  getIt.registerLazySingleton<RecipeLocalDataSource>(
      () => RecipeLocalDataSourceImpl(sharedPreferences: getIt()));
  //shared-preference
  getIt.registerLazySingleton(() => sharedPreference);

  getIt.registerLazySingleton<RecipeRepository>(() => RecipeRepositoryImpl(
      remoteDataSource: getIt(), localDataSource: getIt()));

  // use- case
  getIt.registerLazySingleton(() => GetTrendingRecipeUseCase(getIt()));

  getIt.registerLazySingleton(() => GetRecipeDetailsUsecase(getIt()));

  //Trending-BLOC
  getIt.registerLazySingleton(() => TrendingRecipeBloc(getIt()));

  //Recipe-detail-BLOC
  getIt.registerLazySingleton(() => RecipeDetailsBloc(getIt()));
}
