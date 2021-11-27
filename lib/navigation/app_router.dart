import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;
  final GroceryManager groceryManager;
  final ProfileManager profileManager;

  AppRouter({
    required this.appStateManager,
    required this.groceryManager,
    required this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    //TODO: Add Listeners
    appStateManager.addListener(notifyListeners);
    groceryManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  //TODO: Dispose listeners
  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    groceryManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      //TODO: Add onPopPage
      onPopPage: _handlePopPage,
      pages: [
        //TODO: Add SplashScreen
        //TODO: Add LoginScreen
        //TODO: Add OnBoardingScreen
        //TODO: Add Home
        //TODO: Create new Item
        //TODO: Select GroceryItemScreen
        //TODO: Add Profile Screen
        //TODO: Add WebView Screen
      ],
    );
  }

  //TODO: Add _handlePopPage - Helper Method when user taps back button
  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    //TODO: Handle Onboarding and splash
    //TODO: Handle State when user closes grocery item screen
    //TODO: Handle State when user closes profile screen
    //TODO: Handle state when user closes WebView Screen

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
