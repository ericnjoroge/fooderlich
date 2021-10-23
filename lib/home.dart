import 'package:flutter/material.dart';
import 'card1.dart';
import 'author_card.dart';

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
    const RecipeCard(),
    const AuthorCard(),
    Container(color: Colors.blue)
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
              icon: Icon(Icons.card_giftcard), label: 'Recipe'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Author'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Explore')
        ],
      ),
    );
  }
}
