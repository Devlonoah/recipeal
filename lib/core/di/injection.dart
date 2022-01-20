import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../data/repository/authentication_repository_impl.dart';
import '../../data/repository/firestore_repository_impl.dart';
import '../../domain/repository/authentication_repository.dart';
import '../../domain/repository/firestore_repository.dart';
import '../../domain/usecases/add_to_favorite.dart';
import '../../domain/usecases/get_favorite_recipe.dart';
import '../../domain/usecases/get_recipe_instruction.dart';
import '../../domain/usecases/get_recommended.dart';
import '../../domain/usecases/get_similar_recipe.dart';
import '../../domain/usecases/get_user_usecase.dart';
import '../../domain/usecases/search_recipe.dart';
import '../../domain/usecases/sign_in_with_google.dart';
import '../../domain/usecases/sign_out.dart';
import '../../presentation/bloc/authentication/authentication_cubit.dart';
import '../../presentation/bloc/favorite/favorite_bloc.dart';
import '../../presentation/bloc/recommended_recipe/recommended_recipe_bloc.dart';
import '../../presentation/bloc/search/search_bloc.dart';
import '../../presentation/bloc/user/user_cubit.dart';
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

  final firebaseAuth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  final firebaseStore = FirebaseFirestore.instance;

  getIt.registerLazySingleton(() => firebaseStore);
  getIt.registerLazySingleton(() => firebaseAuth);

  getIt.registerLazySingleton(() => googleSignIn);
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
  getIt.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(
          googleSignIn: getIt(), firebaseAuth: getIt()));

  getIt.registerLazySingleton<FirestoreRepository>(() =>
      FirestoreRepositoryImpl(
          firebaseAuth: getIt(), firebaseFirestore: getIt()));
  // use- case
  getIt.registerLazySingleton(() => GetTrendingRecipeUseCase(getIt()));

  getIt.registerLazySingleton(() => GetRecipeDetailsUsecase(getIt()));

  getIt.registerLazySingleton(() => GetRecipeInstructionUsecase(getIt()));

  getIt.registerLazySingleton(() => GetSimilarRecipeUsecase(getIt()));

  getIt.registerLazySingleton(() => SignInWithGoogleUsecase(getIt()));

  getIt.registerLazySingleton(() => SignOutUsecase(getIt()));

  getIt.registerLazySingleton(() => GetUserUsecase(getIt()));
  getIt.registerLazySingleton(() => AddToSaveFavoriteUsecase(getIt()));

  getIt.registerLazySingleton(() => GetFavoriteRecipeUsecase(getIt()));

  getIt.registerLazySingleton(() => SearchRecipeUsecase(getIt()));

  getIt.registerLazySingleton(() => GetRecommendedUsecase(getIt()));

  //Trending-BLOC
  getIt.registerLazySingleton(() => TrendingRecipeBloc(getIt()));

  //Recipe-detail-BLOC
  getIt.registerLazySingleton(() => RecipeDetailsBloc(getIt()));

  getIt.registerFactory(() => AuthenticationCubit(
      signInWithGoogleUsecase: getIt(), signOutUsecase: getIt()));

  getIt.registerFactory(() => UserCubit(getIt()));

  getIt.registerFactory(() => FavoriteBloc(
      addToSaveFavoriteUsecase: getIt(), getFavoriteRecipeUsecase: getIt()));

  getIt.registerFactory(() => SearchBloc(getIt()));

  getIt.registerFactory(() => RecommendedRecipeBloc(getIt()));
}
