import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();
  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Add TodayRecipeListView FutureBuilder
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          //TODO: Add Nested List Views
          if (snapshot.connectionState == ConnectionState.done) {
            final recipes = snapshot.data?.todayRecipes ?? [];
            final friendPosts = snapshot.data?.friendPosts ?? [];
            //TODO: Replace with TodayRecipeListView
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                TodaysRecipeListView(recipes: recipes),
                const SizedBox(
                  height: 16,
                ),
                // TODO: Replace with FriendPostListView
                FriendPostListView(friendPosts: friendPosts),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
