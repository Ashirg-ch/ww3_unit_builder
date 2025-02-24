import 'package:ww3_unit_builder/data/order_position.dart';

import 'formations_list.dart';

class Formation {
  final String name;

  /// The size of the formation.
  ///
  /// This describes the size of the formation,
  /// such as "platoon" or "company".
  ///
  /// This is used to determine the symbol that should be shown in the GUI.
  final String size;

  /// The type of the formation.
  ///
  /// This describes the type of the formation,
  /// such as "infantry", "armor", "wheeled multiple rocket launcher" or "attack helicopter".
  ///
  /// This is used to determine the symbol that should be shown in the GUI.
  final String type;

  /// Sub-formations that are part of this formation.
  ///
  /// The key is the name of the sub-formation,
  /// while the value is the amount of times the sub-formation is present.
  final Map<String, int> _subFormations;
  final List<OrderPosition> _directUnits;

  const Formation(
    this.name,
    this._subFormations,
    this._directUnits,
    this.size,
    this.type,
  );

  factory Formation.fromJson(Map<String, dynamic> json) {
    try {
      return Formation(
        json['name'] as String,
        Formation._parseSubFormations(
          json['subFormations'] as List<dynamic>? ?? const [],
        ),
        (json['units'] as List?)
                ?.map((e) => OrderPosition.fromJson(e))
                .toList() ??
            const [],
        json['size'] as String? ?? '',
        json['type'] as String? ?? 'generic',
      );
    } catch (e) {
      print('Error parsing Formation from JSON: $json\nError: $e');
      rethrow;
    }
  }

  static Map<String, int> _parseSubFormations(List<dynamic> json) {
    final Map<String, int> subFormations = {};
    for (final subFormation in json) {
      subFormations[subFormation['name'] as String] =
          subFormation['count'] as int;
    }
    return subFormations;
  }

  List<OrderPosition> get getAllUnits {
    final List<OrderPosition> allUnits = [];
    allUnits.addAll(_directUnits);
    for (final subFormation in _subFormations.entries) {
      for (int i = 0; i < subFormation.value; i++) {
        allUnits.addAll(
          FormationsList().getFormation(subFormation.key).getAllUnits,
        );
      }
    }
    return allUnits;
  }
}
