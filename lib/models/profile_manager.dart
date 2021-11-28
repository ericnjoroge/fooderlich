import 'package:flutter/material.dart';

import 'models.dart';

class ProfileManager extends ChangeNotifier {
  User get getUser => User(
        firstName: "Minnie",
        lastName: "More",
        role: 'Flutterista',
        profileImageUrl: 'assets/profile_pics/avatar.png',
        points: 100,
        darkMode: _darkMode,
      );

  bool get didSelectUser => _didSelectUser;
  bool get didTapOnExternalLink => _tapOnExternalLink;
  bool get darkMode => _darkMode;

  var _didSelectUser = false;
  var _tapOnExternalLink = false;
  var _darkMode = false;

  void set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  void tapOnExternalLink(bool selected) {
    _tapOnExternalLink = selected;
    notifyListeners();
  }

  void tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}
