import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: Center(
        child: Text(
          'Let\'s get cooking 👩‍🍳',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      // TODO: Add bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Card'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Card2'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Card3')
        ],
      ),
    );
  }
}
