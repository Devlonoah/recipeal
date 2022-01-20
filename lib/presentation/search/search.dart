import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/size.dart';
import '../../core/di/injection.dart';
import '../bloc/search/search_bloc.dart';
import '../recipe_info/recipe_info.dart';
import '../../spacing.dart';

class SearchPage extends StatelessWidget {
  static String id = "SearchPage";
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: BlocProvider(
                create: (context) => getIt<SearchBloc>(),
                child: SearchPageBody())));
  }
}

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchBar(),
        addVerticalSpace(20),
        buildRecipeView(),
      ],
    );
  }

  Expanded buildRecipeView() {
    return Expanded(
        child: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is SearchInitial) {
        return const Center(
          child: Text('Search Recipe'),
        );
      }

      if (state is SearchLoaded) {
        if (state.result.totalResults == 0) {
          return const Center(child: Text('Empty result'));
        }
        ;
        return _searchLoadedWidget(context: context, resultstate: state);
      }

      if (state is SearchFailure) {
        return Center(
            child: Image.asset(
          'assets/search_icon.png',
          fit: BoxFit.cover,
          height: 150,
          width: 150,
        ));
      }

      return _searchLoadingWidget();
      ;
    }));
  }

  Widget _searchLoadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _searchLoadedWidget(
      {required BuildContext context, required SearchLoaded resultstate}) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding:
            const EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
        itemCount: resultstate.result.results?.length,
        itemBuilder: (context, index) {
          final _result = resultstate.result.results?[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RecipeInfo.id,
                  arguments: _result?.id);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: CachedNetworkImage(
                  imageUrl: _result!.image!,
                  fit: BoxFit.cover,
                )),
                Text(_result.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontWeight: FontWeight.bold, height: 1.2)),
              ],
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          mainAxisSpacing: kDefaultHorizontalPadding,
          crossAxisSpacing: kDefaultHorizontalPadding,
        ));
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController? textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0, horizontal: kDefaultHorizontalPadding),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),

            height: 55,
            width: double.infinity,
            // color: Colors.red,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                    child: TextField(
                      controller: textEditingController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search for recipe',
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    String? text = textEditingController?.value.text.trim();

                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchEvent(text ?? ''));
                  },
                  child: const Icon(
                    Icons.send,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
