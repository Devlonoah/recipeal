import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeal/presentation/bloc/recipe_details/recipe_details_bloc.dart';
import 'package:recipeal/theme/colors.dart';

class RecipeInfoAppBAr extends StatelessWidget {
  const RecipeInfoAppBAr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeDetailsBloc, RecipeDetailsState>(
        builder: (context, state) {
      if (state is RecipeDetailsLoaded) {
        return Container(
            height: AppBar().preferredSize.height,
            width: AppBar().preferredSize.width,
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                Row(
                  children: [
                    IconButton(
                      tooltip: 'visit website',
                      onPressed: () {},
                      icon: const Icon(Icons.view_list),
                    ),
                    IconButton(
                      tooltip: 'share recipe',
                      onPressed: () {},
                      icon: const Icon(Icons.share),
                    ),
                    IconButton(
                        tooltip: 'add to favourite',
                        onPressed: () async {
                          // context
                          //     .read<FavoriteBloc>()
                          //     .add(FavouriteAdded(recipeDetails.recipesModel));
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: kkPink,
                        ))
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
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            ],
          ));
    });
  }
}


//   // final recipeDetails =
//   //     (context.read<RecipeDetailsBloc>().state as RecipeDetailsLoaded);

//   // final favoriteRecipes = (context.read<FavoriteBloc>().state);

//   // final isAddedToFavorite = favoriteRecipes.recipes
//   //     .any((element) => element.id == recipeDetails.recipesModel.id);
