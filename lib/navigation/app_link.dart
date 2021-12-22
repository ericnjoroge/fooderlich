import 'package:flutter/material.dart';

class AppLink {
  static const String homePath = '/home';
  static const String onBoardingPath = '/onboarding';
  static const String loginPath = '/login';
  static const String profilePath = '/profile';
  static const String itemPath = '/item';

  static const String tabParam = 'tab';
  static const String idParam = 'id';

  String? location;
  int? currentTab;
  String? itemId;

  AppLink({
    this.location,
    this.currentTab,
    this.itemId,
  });

  //TODO: Add toLocation
  String toLocation() {
    String addKeyValuePair({
      required String key,
      String? value,
    }) =>
        value == null ? '' : '${key}=$value&';

    switch (location) {
      case loginPath:
        return loginPath;
      case onBoardingPath:
        return onBoardingPath;
      case profilePath:
        return profilePath;
      case itemPath:
        var loc = '$itemPath?';
        loc += addKeyValuePair(key: idParam, value: itemId);
        return Uri.encodeFull(loc);
      default:
        var loc = '$homePath?';
        loc += addKeyValuePair(
          key: tabParam,
          value: currentTab.toString(),
        );
        return Uri.encodeFull(loc);
    }
  }

  //TODO: Add fromLocation
  static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');
    final uri = Uri.parse(location);
    final params = uri.queryParameters;

    final currentTab = int.tryParse(params[AppLink.tabParam] ?? '');
    final itemId = params[AppLink.idParam];

    final link = AppLink(
      location: location,
      currentTab: currentTab,
      itemId: itemId,
    );

    return link;
  }
}
