import 'package:flutter/material.dart';

import '../fooderlich_theme.dart';
import '../models/models.dart';

class RecipeCard extends StatelessWidget {
  final ExploreRecipe recipe;

  const RecipeCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      //TODO: Add a stack of text
      child: Stack(
        children: [
          Text(
            recipe.subtitle,
            style: FooderlichTheme.darkTextTheme.bodyText1,
          ),
          Positioned(
            child: Text(
              recipe.title,
              style: FooderlichTheme.darkTextTheme.headline5,
            ),
            top: 20,
          ),
          Positioned(
            child: Text(
              recipe.message,
              style: FooderlichTheme.darkTextTheme.bodyText1,
            ),
            bottom: 30,
            right: 0,
          ),
          Positioned(
            child: Text(
              recipe.authorName,
              style: FooderlichTheme.darkTextTheme.bodyText1,
            ),
            bottom: 10,
            right: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints.expand(
        width: 350,
        height: 450,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    ));
  }
}
