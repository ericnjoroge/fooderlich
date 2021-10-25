import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';

class TodaysRecipeListView extends StatelessWidget {
  final List<ExploreRecipe> recipes;

  const TodaysRecipeListView({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recipes of the Day 🍳',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 400,
            //TODO: Add Listview
            color: Colors.transparent,
            child: recipes.isEmpty
                ? const Center(
                    child: Text('Could not find a list of recipes to display'),
                  )
                : ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = recipes[index];
                      return buildCard(recipe);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 16,
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }

  //TODO: Add buildCard() widget
  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return RecipeCard(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return AuthorCard(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return ExploreCard(recipe: recipe);
    } else {
      throw Exception('This  card doesn\'t exist yet');
    }
  }
}
