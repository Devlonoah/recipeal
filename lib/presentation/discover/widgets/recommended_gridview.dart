// ignore: unused_element

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:recipeal/constants/size.dart';
import 'package:recipeal/global_widget/loading_widget.dart';
import 'package:recipeal/presentation/bloc/recommended_recipe/recommended_recipe_bloc.dart';
import 'package:recipeal/presentation/recipe_info/recipe_info.dart';
import 'package:recipeal/theme/colors.dart';

import '../../../spacing.dart';

class RecommendedGridView extends StatelessWidget {
  const RecommendedGridView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedRecipeBloc, RecommendedRecipeState>(
      builder: (context, state) {
        if (state is RecommendedRecipeFailure) {
          return Center(
            child: TextButton(
              onPressed: () {},
              child: Text('Retry'),
            ),
          );
        }

        if (state is RecommendedRecipeLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultHorizontalPadding),
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
                    mainAxisSpacing: 20,
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
                                    return Icon(
                                        Icons.image_not_supported_outlined);
                                  },
                                  progressIndicatorBuilder:
                                      (context, url, progress) {
                                    return SpinKitFadingCircle(
                                      color: kkPink,
                                      size: 20,
                                    );
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
                                        fontWeight: FontWeight.bold,
                                        height: 1.2)),
                          ]),
                    );
                  }),
              addVerticalSpace(10),
            ],
          );
        }

        return LoadingWidget();
      },
    );
  }
}
