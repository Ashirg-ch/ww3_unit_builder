import 'dart:convert';

import 'package:ww3_unit_builder/data/unit_modification.dart';

class ModificationsList {
  final List<UnitModification> _modifications = [];

  static final ModificationsList _instance = ModificationsList._();

  ModificationsList._();

  factory ModificationsList() {
    return _instance;
  }

  List<UnitModification> get modifications => List.unmodifiable(_modifications);

  /// Get a modification by its name.
  ///
  /// Throws an [ArgumentError] if no modification with the given name exists.
  UnitModification getModification(String name) {
    return _modifications.firstWhere(
      (element) => element.name == name,
      orElse: () => throw ArgumentError('No modification with name $name'),
    );
  }

  void loadModifications(String json) {
    _modifications.clear();
    _modifications.addAll(
      (jsonDecode(json) as List).map((e) => UnitModification.fromJson(e)),
    );
  }
}
