import 'package:flutter/material.dart';

import 'author_info.dart';
import '../fooderlich_theme.dart';
import '../models/models.dart';

class AuthorCard extends StatelessWidget {
  final ExploreRecipe recipe;

  const AuthorCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          constraints: const BoxConstraints.expand(width: 350, height: 450),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(recipe.backgroundImage), fit: BoxFit.cover),
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: Column(
            children: [
              //TODO: Add author Info
              AuthorInfo(
                title: recipe.role,
                authorName: recipe.authorName,
                imageProvider: AssetImage(recipe.profileImage),
              ),
              //TODO: Add positioned text
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 16,
                        right: 16,
                        child: Text(
                          recipe.title,
                          style: FooderlichTheme.lightTextTheme.headline2,
                        )),
                    Positioned(
                      bottom: 70,
                      left: 16,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          recipe.subtitle,
                          style: FooderlichTheme.lightTextTheme.headline2,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
