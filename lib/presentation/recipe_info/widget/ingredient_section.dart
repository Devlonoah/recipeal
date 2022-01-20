import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/size.dart';
import '../../bloc/recipe_details/recipe_details_bloc.dart';

import '../../../spacing.dart';

class IngredientSection extends StatelessWidget {
  const IngredientSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeDetailsBloc, RecipeDetailsState>(
      builder: (context, state) {
        //loaded

        if (state is RecipeDetailsLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultHorizontalPadding),
                child: Text(
                  'Ingredients',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              addVerticalSpace(10),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: state.recipesModel.extendedIngredients.length,
                  itemBuilder: (context, index) {
                    final _ingredient =
                        state.recipesModel.extendedIngredients[index];
                    return IngredientsWidget(
                      ingredientName: _ingredient.name,
                      measurementValue: _ingredient.unit,
                      unitValue: _ingredient.amount.toString(),
                    );
                  }),
            ],
          );
        }

        //initial and loading

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class IngredientsWidget extends StatelessWidget {
  const IngredientsWidget({
    Key? key,
    required this.ingredientName,
    required this.measurementValue,
    required this.unitValue,
  }) : super(key: key);

  final String ingredientName;
  final String measurementValue;
  final String unitValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultHorizontalPadding, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ingredientName,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.black87),
          ),
          Text(
            "${double.parse(unitValue).toStringAsFixed(1)} $measurementValue",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
