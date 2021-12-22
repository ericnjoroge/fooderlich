import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

import 'explore_screen.dart';
import 'recipes_screen.dart';
import 'grocery_screen.dart';

class Home extends StatefulWidget {
  static MaterialPage page(String title, int currentTab) {
    return MaterialPage(
        name: FooderlichPages.home,
        key: ValueKey(FooderlichPages.home),
        child: Home(
          title: title,
          currentTab: currentTab,
        ));
  }

  const Home({
    Key? key,
    required this.title,
    required this.currentTab,
  }) : super(key: key);

  final String title;
  final int currentTab;

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
    return Consumer(builder: (context, appStateManager, child) {
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
        body: IndexedStack(
          index: widget.currentTab,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: widget.currentTab,
          onTap: (index) {
            Provider.of<AppStateManager>(context, listen: false).goToTab(index);
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
          Provider.of<ProfileManager>(context, listen: false)
              .tapOnProfile(true);
        },
      ),
    );
  }
}
