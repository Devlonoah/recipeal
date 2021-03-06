import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/colors.dart';
import '../bloc/recommended_recipe/recommended_recipe_bloc.dart';
import '../bloc/tab_manager/tabmanager_bloc.dart';
import '../bloc/trending_recipe/trending_recipe_bloc.dart';
import '../discover/discover.dart';
import '../profile/profile.dart';
import '../search/search.dart';

class TabManager extends StatefulWidget {
  static String id = 'TabManager';
  const TabManager({Key? key}) : super(key: key);

  @override
  State<TabManager> createState() => _TabManagerState();
}

class _TabManagerState extends State<TabManager> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<TrendingRecipeBloc>(context).add(GetTrendingRecipe());
    BlocProvider.of<RecommendedRecipeBloc>(context)
        .add(const RecommendedRecipeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabManagerBloc, TabmanagerState>(
      builder: (context, state) {
        return Scaffold(
            body: IndexedStack(
              index: state.index,
              children: const [
                DiscoverPage(),
                SearchPage(),
                Profile(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: kkPink,
              currentIndex: state.index,
              onTap: (x) {
                BlocProvider.of<TabManagerBloc>(context)
                    .add(TabmanagerEvent(index: x));
              },
              selectedLabelStyle: Theme.of(context)
                  .bottomNavigationBarTheme
                  .selectedLabelStyle
                  ?.copyWith(fontWeight: FontWeight.bold),
              items: bottomBarItemDetails
                  .map((e) => BottomNavigationBarItem(
                      icon: Icon(e.icon), label: e.label))
                  .toList(),
            ));
      },
    );
  }
}

final bottomBarItemDetails = <BottomBarItemDetail>[
  BottomBarItemDetail(label: 'Home', icon: Icons.search),
  BottomBarItemDetail(label: 'Discover', icon: Icons.favorite_outline),
  BottomBarItemDetail(label: 'My Recipe', icon: Icons.person)
];

class BottomBarItemDetail {
  final String label;
  final IconData icon;

  BottomBarItemDetail({
    required this.label,
    required this.icon,
  });
}
