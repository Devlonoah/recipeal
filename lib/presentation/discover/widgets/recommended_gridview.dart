// ignore: unused_element

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipeal/constants/size.dart';
import 'package:recipeal/presentation/bloc/recommended_recipe/recommended_recipe_bloc.dart';
import 'package:recipeal/presentation/recipe_info/recipe_info.dart';

import '../../../spacing.dart';

class RecommendedGridView extends StatelessWidget {
  final RecommendedRecipeLoaded state;

  const RecommendedGridView({
    Key? key,
    required this.state,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
          child: Text(
            'Just for you',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        addVerticalSpace(10),
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultHorizontalPadding),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
            ),
            itemCount: state.trendingRecipeResulEntity.recipes.length,
            itemBuilder: (context, index) {
              final _recommendedRecipe =
                  state.trendingRecipeResulEntity.recipes[index];

              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RecipeInfo.id,
                      arguments: _recommendedRecipe.id);
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: CachedNetworkImage(
                            imageUrl: _recommendedRecipe.image,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              return Icon(Icons.image_not_supported_outlined);
                            },
                          ),
                        ),
                      ),
                      addVerticalSpace(5),
                      Text(_recommendedRecipe.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, height: 1.2)),
                    ]),
              );
            })
      ],
    );
  }
}
