import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'empty_grocery_screen.dart';
import '../models/models.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Add a scaffold widget
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //TODO: Present GroceryItemScreen
        },
      ),
      body: buildGroceryScreen(),
    );
  }

  //TODO: Add buildGrocerySCreen
  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(builder: (context, manager, child) {
      if (manager.groceryItems.isNotEmpty) {
        return Container();
      } else {
        return const EmptyGroceryScreen();
      }
    });
  }
}
