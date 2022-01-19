import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeal/domain/entities/random_recipe_result_entity.dart';
import 'package:recipeal/presentation/bloc/trending_recipe/trending_recipe_bloc.dart';
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
        child: DiscoverPageBody(),
      ),
    );
  }
}

class DiscoverPageBody extends StatelessWidget {
  const DiscoverPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        _buildCustomAppBarWithSearchBar(size),
        addVerticalSpace(20),
        Expanded(
          child: BlocBuilder<TrendingRecipeBloc, TrendingRecipeState>(
              builder: (context, state) {
            if (state is TrendingRecipeLoaded) {
              return _TrendingHorizontalListView(state: state);
            }

            if (state is TrendingRecipeFailure) {
              return const Center(child: Text("Error occured"));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ),
      ],
    );
  }

  _buildCustomAppBarWithSearchBar(Size size) {
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
          child: const TextField(
            readOnly: true,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              isDense: true,
              hintText: 'Search for recipe',
            ),
          ),
        ),
      ),
    );
  }
}

class _TrendingHorizontalListView extends StatelessWidget {
  final TrendingRecipeLoaded state;

  const _TrendingHorizontalListView({
    Key? key,
    required this.state,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
          child: Text(
            'Trending',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        addVerticalSpace(10),
        Expanded(
          child: ListView.builder(
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
                              errorWidget: (context, url, error) => const Icon(
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
}
