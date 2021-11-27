import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';
import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
          ChangeNotifierProvider(create: (context) => GroceryManager()),
        ],
        child: const Home(title: 'Fooderlich'),
      ),
    );
  }
}
