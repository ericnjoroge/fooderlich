import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();

    return MaterialApp(
      title: 'Fooderlich',
      // TODO: Create theme
      theme: theme,
      home: const MyHomePage(title: 'Fooderlich'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: Style the title
        title: Text(widget.title),
      ),
      // TODO: Style the body text
      body: const Center(
        child: Text(
          'Let\'s get cooking 👩‍🍳',
        ),
      ),
    );
  }
}
