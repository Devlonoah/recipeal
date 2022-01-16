import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeal/core/di/injection.dart';
import 'package:recipeal/domain/usecases/get_recipe_details.dart';
import 'package:recipeal/presentation/bloc/recipe_details/recipe_details_bloc.dart';
import '../../constants/size.dart';
import '../../spacing.dart';

class RecipeInfo extends StatefulWidget {
  static String id = 'RecipeInfo';

  const RecipeInfo({Key? key}) : super(key: key);

  @override
  State<RecipeInfo> createState() => _RecipeInfoState();
}

class _RecipeInfoState extends State<RecipeInfo> {
  // RecipeDetailsBloc? recipeDetailsBloc;

  @override
  void initState() {
    super.initState();
    //
    // recipeDetailsBloc = RecipeDetailsBloc(getIt<GetRecipeDetailsUsecase>());
    //
    // print(recipeDetailsBloc!.state);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final idPassed = (ModalRoute.of(context)?.settings.arguments) as String;
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: BlocProvider(
            create: (context) =>
                RecipeDetailsBloc(getIt<GetRecipeDetailsUsecase>())
                  ..add(GetRecipeDetails(716429)),
            child: RecipeInfoBody()),
      ),
    );
  }
}

class RecipeInfoBody extends StatelessWidget {
  const RecipeInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: context.read<RecipeDetailsBloc>(),
        builder: (context, state) {
          if (state is RecipeDetailsFailure) {
            return const Center(child: Icon(Icons.error));
          }

          if (state is RecipeDetailsLoaded) {
            return _buildLoaded(context, state);
          }
          print('the recipe bloc state is $state');
          return const Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildLoaded(BuildContext context, RecipeDetailsLoaded state) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addVerticalSpace(15),
          buildTitleAndTimeToCook(context),
          addVerticalSpace(5),
          buildDishType(),
          addVerticalSpace(10),
          buildImage(size)
        ],
      ),
    );
  }

  Container buildImage(Size size) {
    return Container(
      color: Colors.yellow,
      height: size.height * 0.4,
    );
  }

  SizedBox buildDishType() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          padding: EdgeInsets.only(left: kDefaultHorizontalPadding),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Chip(
                label: Text(
                  'Lunch',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: Colors.white),
                ),
                backgroundColor: Colors.pink,
              ),
            );
          }),
    );
  }

  buildTitleAndTimeToCook(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: kDefaultHorizontalPadding, right: 20),
          child: Text(
            'Salty Caramel Rice Crispy Treats',
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
              Icon(
                Icons.watch_later_outlined,
                size: 15,
              ),
              addHorizontalSpace(5),
              Text(
                'Ready in',
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                ' under 45 minutes',
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
}

AppBar buildAppBar() {
  return AppBar(
    actions: [
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
        onPressed: () {},
        icon: const Icon(Icons.favorite_border_outlined),
      )
    ],
  );
}
