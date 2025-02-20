import 'dart:convert';

import 'formation.dart';

class FormationsList {
  final List<Formation> _formations = [];

  static final FormationsList _instance = FormationsList._();

  FormationsList._();

  factory FormationsList() {
    return _instance;
  }

  List<Formation> get formations => List.unmodifiable(_formations);

  /// Get a formation by its name.
  ///
  /// Throws an [ArgumentError] if no formation with the given name exists.
  Formation getFormation(String name) {
    return _formations.firstWhere(
      (element) => element.name == name,
      orElse: () => throw ArgumentError('No formation with name $name'),
    );
  }

  void loadFormations(String json) {
    _formations.clear();
    _formations.addAll(
      (jsonDecode(json) as List).map((e) => Formation.fromJson(e)),
    );

    // Log
    print('Formations loaded: ${_formations.length}');
  }
}
