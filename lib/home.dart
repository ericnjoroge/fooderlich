import 'package:flutter/material.dart';
import 'screens/explore_screen.dart';
import 'components/recipe_card.dart';
import 'components/author_card.dart';
import 'components/explore_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    //TODO: Replace with RecipeCard
    ExploreScreen(),
    const AuthorCard(),
    const ExploreCard(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      // TODO: Show selected tab
      body: pages[_selectedIndex],
      // TODO: Add bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              icon: Icon(Icons.explore), label: 'Explore'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.book), label: 'Recipes'),
          const BottomNavigationBarItem(icon: Icon(Icons.list), label: 'To Buy')
        ],
      ),
    );
  }
}
