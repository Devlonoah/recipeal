import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static String id = "SearchPage";
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SearchPageBody()));
  }
}

class SearchPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [buildSearchBar(), buildRecipeView()],
    );
  }

  Expanded buildRecipeView() {
    return Expanded(
        child: Container(
      color: Colors.amber,
    ));
  }

  buildSearchBar() {
    return Container(
      height: 65,
      width: double.infinity,
      // color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Center(
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search for recipe',
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Icon(
              Icons.send,
            ),
          )
        ],
      ),
    );
  }
}
