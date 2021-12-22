import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';
import 'fooderlich_theme.dart';
import 'navigation/app_router.dart';
import 'navigation/app_route_parser.dart';

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
  final _appStateManager = AppStateManager();

  late AppRouter _appRouter;
  final routeParser = AppRouteParser();

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
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => _groceryManager),
          ChangeNotifierProvider(create: (context) => _profileManager),
          ChangeNotifierProvider(create: (context) => _appStateManager),
        ],
        child: Consumer<ProfileManager>(
          builder: (context, profileManager, child) {
            ThemeData theme;
            if (profileManager.darkMode) {
              theme = FooderlichTheme.dark();
            } else {
              theme = FooderlichTheme.light();
            }

            return MaterialApp.router(
              theme: theme,
              title: 'Fooderlich',
              backButtonDispatcher: RootBackButtonDispatcher(),
              routeInformationParser: routeParser, 
              routerDelegate: _appRouter,
            );
          },
        ),
      ),
    );
  }
}
