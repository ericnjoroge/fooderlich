import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Import TabManager Provider
import '../models/models.dart';

//Import Screens
import 'explore_screen.dart';
import 'recipes_screen.dart';
import 'grocery_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: [
            profileButton(),
          ],
        ),
        // TODO: Replace Body
        body: IndexedStack(
          index: tabManager.selectedTab,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: tabManager.selectedTab,
          onTap: (index) {
            tabManager.goToTab(index);
          },
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: 'Explore'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.book), label: 'Recipes'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'To Buy')
          ],
        ),
      );
    });
  }

  Widget profileButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            'assets/profile_pics/avatar.png',
          ),
        ),
        onTap: () {
          //TODO: home -> profile
        },
      ),
    );
  }
}
