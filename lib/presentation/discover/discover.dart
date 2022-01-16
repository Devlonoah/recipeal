import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
        _TrendingHorizontalListView()
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
        SizedBox(
          height: 190,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: kDefaultHorizontalPadding),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RecipeInfo.id,
                        arguments: '8932');
                  },
                  child: Container(
                    width: 125,
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                        addVerticalSpace(10),
                        Text('The Best Chewy Chocolate Chip Cookies',
                            textAlign: TextAlign.left,
                            style:
                                Theme.of(context).textTheme.subtitle2?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    // fontSize: 13,
                                    height: 1.2))
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
