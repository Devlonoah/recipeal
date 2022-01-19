import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeal/constants/size.dart';
import 'package:recipeal/presentation/bloc/similar_recipe_cubit/similar_recipe_cubit.dart';

import '../../../spacing.dart';

class SimilarRecipeSection extends StatelessWidget {
  const SimilarRecipeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarRecipeCubit, SimilarRecipeState>(
        builder: (context, state) {
//loading && initial & failed

      if (state is SimilarRecipeInitial || state is SimilarRecipeLoading) {
        // return const SizedBox.shrink();

        return const CircularProgressIndicator(
          color: Colors.green,
        );
      }

//failed

      if (state is SimilarRecipeFailed) {
        return const Center(
          child: Icon(
            Icons.error,
            color: Colors.red,
          ),
        );
      }
//loaded

      if (state is SimilarRecipeLoaded) {
        if (state.entity.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultHorizontalPadding),
              child: Text(
                'Similar Recipe',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            addVerticalSpace(10),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.entity.length,
                  padding:
                      const EdgeInsets.only(left: kDefaultHorizontalPadding),
                  itemBuilder: (context, index) {
                    final _similarRecipe = state.entity[index];
                    final baseImageUrl =
                        "https://spoonacular.com/recipeImages/${_similarRecipe.id}-90x90.jpg";

                    return Padding(
                      padding: const EdgeInsets.only(
                          right: kDefaultHorizontalPadding),
                      child: SizedBox(
                        width: 125,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              imageUrl: baseImageUrl,
                              fit: BoxFit.cover,
                              height: 120,
                            ),
                            addVerticalSpace(10),
                            Expanded(
                              child: Text(_similarRecipe.title,
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          height: 1.2)),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        );
      }

      return const CircularProgressIndicator(
        color: Colors.blue,
      );
    });
  }
}
