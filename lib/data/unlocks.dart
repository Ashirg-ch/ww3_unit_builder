import 'package:flutter/foundation.dart';

/// A class that keeps track of which unlocks have been unlocked.
///
/// This allows the user to dynamically define which research modifications
/// and units are available to them.
///
/// Unavailable items will not be considered for calculations.
class Unlocks extends ChangeNotifier {
  static final Unlocks _singleton = Unlocks._();

  final Map<String, bool> _unlocks = {};

  Unlocks._();

  factory Unlocks() {
    return _singleton;
  }

  bool isUnlocked(String name) {
    return _unlocks[name] ?? false;
  }

  void setUnlocked(String name, bool unlocked) {
    _unlocks[name] = unlocked;
    notifyListeners();
  }

  void toggleUnlocked(String name) {
    setUnlocked(name, !isUnlocked(name));
    notifyListeners();
  }

  List<String> getAll() {
    return _unlocks.keys.toList();
  }
}