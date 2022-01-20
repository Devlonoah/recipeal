import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeal/core/di/injection.dart';
import 'package:recipeal/domain/usecases/get_recipe_details.dart';
import 'package:recipeal/domain/usecases/get_recipe_instruction.dart';
import 'package:recipeal/domain/usecases/get_similar_recipe.dart';
import 'package:recipeal/global_widget/reusable_button.dart';
import 'package:recipeal/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:recipeal/presentation/bloc/recipe_details/recipe_details_bloc.dart';
import 'package:recipeal/presentation/bloc/recipe_instruction/recipe_instruction_bloc.dart';
import 'package:recipeal/presentation/bloc/similar_recipe_cubit/similar_recipe_cubit.dart';
import 'package:recipeal/presentation/recipe_info/widget/ingredient_section.dart';
import 'package:recipeal/presentation/recipe_info/widget/recipe_indo_appbar.dart';
import 'package:recipeal/theme/colors.dart';
import '../../constants/size.dart';
import '../../spacing.dart';

class RecipeInfo extends StatefulWidget {
  static String id = 'RecipeInfo';

  const RecipeInfo({Key? key}) : super(key: key);

  @override
  State<RecipeInfo> createState() => _RecipeInfoState();
}

class _RecipeInfoState extends State<RecipeInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final idPassed = (ModalRoute.of(context)?.settings.arguments) as int;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            lazy: false,
            create: (context) =>
                RecipeInstructionBloc(getIt<GetRecipeInstructionUsecase>())
                  ..add(RecipeInstructionEvent(idPassed))),
        BlocProvider(
            lazy: false,
            create: (context) =>
                RecipeDetailsBloc(getIt<GetRecipeDetailsUsecase>())
                  ..add(GetRecipeDetails(idPassed))),
        // BlocProvider(
        //     create: (context) =>
        //         SimilarRecipeCubit(getIt<GetSimilarRecipeUsecase>()))
      ],
      child: Scaffold(
        body: BlocListener<RecipeDetailsBloc, RecipeDetailsState>(
          listener: (context, state) {
            if (state is RecipeDetailsLoaded) {
              //TODO:Reactivate the function
              // context
              //     .read<SimilarRecipeCubit>()
              //     .getSimilarRecipe(state.recipesModel.id);
            }
          },
          child: const RecipeInfoBody(),
        ),
      ),
    );
  }
}

class RecipeInfoBody extends StatelessWidget {
  const RecipeInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        const RecipeInfoAppBAr(),
        const Expanded(child: RecipeInfoMainView()),
      ],
    );
  }
}

class RecipeInfoMainView extends StatelessWidget {
  const RecipeInfoMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeDetailsBloc, RecipeDetailsState>(
        builder: (context, state) {
      if (state is RecipeDetailsLoaded) {
        return _buildLoadedWidget(context, state);
      }

      if (state is RecipeDetailsFailure) {
        return const Center(child: Icon(Icons.error, color: Colors.black));
      }

      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

Widget _buildLoadedWidget(BuildContext context, RecipeDetailsLoaded state) {
  final size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        addVerticalSpace(15),
        _buildTitileAndDishType(state: state, context: context),
        addVerticalSpace(10),
        _buildRecipeImage(size: size, state: state),
        addVerticalSpace(15),
        const IngredientSection(),
        addVerticalSpace(10),

        //TODO:Future feature
        // Padding(
        //   padding:
        //       const EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
        //   child: ReusableButton(
        //     color: kkBlack,
        //     label: 'Show Instruction',
        //     onTap: () {},
        //   ),
        // ), addVerticalSpace(20),

        // const SimilarRecipeSection()
      ],
    ),
  );
}

_buildTitileAndDishType(
    {required RecipeDetailsLoaded state, required BuildContext context}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildTitleAndTimeToCook(context: context, state: state),
      addVerticalSpace(5),
      buildDishType(state),
    ],
  );
}

buildTitleAndTimeToCook({
  required BuildContext context,
  required RecipeDetailsLoaded state,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: kDefaultHorizontalPadding),
        child: Text(
          state.recipesModel.title,
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      addVerticalSpace(10),
      Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
        child: Row(
          children: [
            const Icon(
              Icons.watch_later_outlined,
              size: 15,
            ),
            addHorizontalSpace(5),
            Text(
              'Ready in',
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              ' under ${state.recipesModel.readyInMinutes} minutes',
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildDishType(RecipeDetailsLoaded state) {
  if (state.recipesModel.dishTypes.isEmpty) {
    return const SizedBox.shrink();
  }

  return SizedBox(
    height: 25,
    child: ListView.builder(
        padding: const EdgeInsets.only(left: kDefaultHorizontalPadding),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: state.recipesModel.dishTypes.length,
        itemBuilder: (context, index) {
          final _dish = state.recipesModel.dishTypes[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  color: Colors.pink, borderRadius: BorderRadius.circular(5.0)),
              child: Center(
                child: Text(
                  _dish,
                  style: Theme.of(context).textTheme.caption?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        }),
  );
}

Container _buildRecipeImage(
    {required Size size, required RecipeDetailsLoaded state}) {
  return Container(
    color: Colors.grey[300],
    height: size.height * 0.4,
    width: double.infinity,
    child: CachedNetworkImage(
      imageUrl: state.recipesModel.image,
      fit: BoxFit.fitHeight,
      errorWidget: (context, url, error) {
        return const Center(
          child: Icon(Icons.image_not_supported),
        );
      },
    ),
  );
}
