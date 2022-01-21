import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:recipeal/global_widget/loading_widget.dart';
import 'package:recipeal/presentation/discover/widgets/recommended_gridview.dart';
import '../../domain/entities/favorite_recipe_entity_for_db.dart';
import '../bloc/favorite/favorite_bloc.dart';
import '../bloc/recommended_recipe/recommended_recipe_bloc.dart';
import '../bloc/tab_manager/tabmanager_bloc.dart';
import '../bloc/trending_recipe/trending_recipe_bloc.dart';
import '../../constants/colors.dart';
import '../../constants/size.dart';
import '../recipe_info/recipe_info.dart';
import '../../spacing.dart';

class DiscoverPage extends StatelessWidget {
  static String id = 'DiscoverPage';
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: DiscoverPageBody2(),
    ));
  }
}

class DiscoverPageBody2 extends StatelessWidget {
  const DiscoverPageBody2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        // Dummy search bar
        SliverToBoxAdapter(
          child: _buildDummySearchBar(size, context: context),
        ),

        //
        const SliverToBoxAdapter(
          // Trending recipe
          child: _TrendingHorizontalListView(),
        ),

        const SliverPadding(padding: EdgeInsets.symmetric(vertical: 15)),
        // Recommended recipes
        const SliverToBoxAdapter(
          child: RecommendedGridView(),
        ),

        //FavoriteWidget
        const SliverToBoxAdapter(
          child: FavoriteWidget(),
        )
      ],
    );
  }
}

_buildDummySearchBar(Size size, {BuildContext? context}) {
  return Container(
    decoration: BoxDecoration(
      color: xyzz,
      boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2.5)),
      ],
    ),
    child: GestureDetector(
      onTap: () => BlocProvider.of<TabManagerBloc>(context!)
          .add(const TabmanagerEvent(index: 1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultHorizontalPadding, vertical: 10),
        child: Container(
          height: size.height * 0.06,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(child: Text('Search yummy recipe')),
        ),
      ),
    ),
  );
}

class RecommendedRecipes extends StatelessWidget {
  const RecommendedRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedRecipeBloc, RecommendedRecipeState>(
        builder: (context, state) {
      if (state is RecommendedRecipeLoaded) {
        return const RecommendedGridView();
      }

      if (state is RecommendedRecipeFailure) {
        return const Center(child: Text("Error occurred"));
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

class _TrendingHorizontalListView extends StatelessWidget {
  const _TrendingHorizontalListView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingRecipeBloc, TrendingRecipeState>(
        builder: (context, state) {
      if (state is TrendingRecipeFailure) {
        return const Center(
          child: Text('Error occured'),
        );
      }

      if (state is TrendingRecipeLoaded) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            addVerticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultHorizontalPadding),
              child: Text(
                'Trending',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            addVerticalSpace(10),
            SizedBox(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: kDefaultHorizontalPadding),
                itemCount: state.trendingRecipeResult.recipes.length,
                itemBuilder: (context, index) {
                  final _recipe = state.trendingRecipeResult.recipes[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RecipeInfo.id,
                            arguments: _recipe.id);
                      },
                      child: SizedBox(
                        width: 125,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                color: Colors.grey[300],
                                child: CachedNetworkImage(
                                  imageUrl: _recipe.image,
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.image_not_supported,
                                    color: Colors.grey,
                                  ),
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: 125,
                                ),
                              ),
                            ),
                            addVerticalSpace(10),
                            Expanded(
                              child: Text(_recipe.title,
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
                    ),
                  );
                },
              ),
            )
          ],
        );
      }

      return LoadingWidget();
    });
  }
}

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
          BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
        if (state.recipes.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultHorizontalPadding),
              child: Text('Favourite Recipe',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold, height: 1.2)),
            ),
            addVerticalSpace(10),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultHorizontalPadding),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 20),
                  itemCount: state.recipes.length,
                  itemBuilder: (context, index) {
                    final _favoriteRecipe = state.recipes[index];

                    return GestureDetector(
                      onTap: () =>
                          _navigateToRecipeInfo(context, _favoriteRecipe),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: CachedNetworkImage(
                                imageUrl: _favoriteRecipe.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            addVerticalSpace(5),
                            Text(_favoriteRecipe.title,
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
            ),
          ],
        );
      }),
    );
  }

  void _navigateToRecipeInfo(
      BuildContext context, FavoriteRecipeEntityForDb favorite) {
    Navigator.pushNamed(context, RecipeInfo.id, arguments: favorite.id);
  }
}
