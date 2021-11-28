import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';
import 'fooderlich_theme.dart';
//TODO: Import app_router
import 'navigation/app_router.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatefulWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  State<Fooderlich> createState() => _FooderlichState();
}

class _FooderlichState extends State<Fooderlich> {
  final _groceryManager = GroceryManager();
  final _profileManager = ProfileManager();
  //TODO: Create AppStateManager
  final _appStateManager = AppStateManager();

  //TODO: Define AppRouter
  late AppRouter _appRouter;
  //TODO: Initialize app router
  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      groceryManager: _groceryManager,
      profileManager: _profileManager,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();

    return MaterialApp(
      title: 'Fooderlich',
      // TODO: Create theme
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          //TODO: Add GroceryManager Provider
          ChangeNotifierProvider(create: (context) => _groceryManager),
          ChangeNotifierProvider(create: (context) => _profileManager),
          ChangeNotifierProvider(create: (context) => _appStateManager),
          //TODO: Add AppStateManager Provider
        ],
        child: Consumer<ProfileManager>(
          builder: (context, profileManager, child) {
            ThemeData theme;
            if (profileManager.darkMode) {
              theme = FooderlichTheme.dark();
            } else {
              theme = FooderlichTheme.light();
            }

            return MaterialApp(
              theme: theme,
              title: 'Fooderlich',
              home: Router(
                routerDelegate: _appRouter,
                //TODO: Add backButtonDispatcher
              ),
            );
          },
        ),
      ),
    );
  }
}
