import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeal/presentation/bloc/user/user_cubit.dart';
import '../../../constants/size.dart';
import '../../bloc/favorite/favorite_bloc.dart';
import '../../bloc/recipe_details/recipe_details_bloc.dart';
import '../../../theme/colors.dart';

class RecipeInfoAppBAr extends StatelessWidget {
  const RecipeInfoAppBAr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeDetailsBloc, RecipeDetailsState>(
        builder: (context, state) {
      if (state is RecipeDetailsLoaded) {
        final recipeDetails =
            (context.read<RecipeDetailsBloc>().state as RecipeDetailsLoaded);

        final favoriteRecipes = (context.read<FavoriteBloc>().state);

        final userState = context.read<UserCubit>().state;

        final isAddedToFavorite = favoriteRecipes.recipes
            .any((element) => element.id == recipeDetails.recipesModel.id);

        return Container(
            padding:
                EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
            height: AppBar().preferredSize.height,
            width: AppBar().preferredSize.width,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back)),
                Row(
                  children: [
                    isAddedToFavorite
                        ? Icon(Icons.favorite, color: kkPink)
                        : IconButton(
                            tooltip: 'add to favourite',
                            onPressed: () async {
                              if (userState is UserLoaded) {
                                context.read<FavoriteBloc>().add(
                                    FavouriteAdded(recipeDetails.recipesModel));
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Not Signed in'),
                                      content: const Text(
                                          'Sign in to add recipe to favorites'),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Close'))
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            icon: const Icon(Icons.favorite_border_outlined),
                          )
                  ],
                )
              ],
            ));
      }
      return Container(
          height: AppBar().preferredSize.height,
          width: AppBar().preferredSize.width,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back)),
            ],
          ));
    });
  }
}
