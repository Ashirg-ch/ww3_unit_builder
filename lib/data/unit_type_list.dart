import 'dart:convert';

import 'package:ww3_unit_builder/data/unit_type.dart';

class UnitTypeList {
  final List<UnitType> _unitTypes = [];

  static final UnitTypeList _singleton = UnitTypeList._();

  UnitTypeList._();

  factory UnitTypeList() {
    return _singleton;
  }

  void loadUnitTypes(String json) {
    _unitTypes.clear();
    _unitTypes.addAll(
      (jsonDecode(json) as List).map((e) => UnitType.fromJson(e)),
    );
  }

  UnitType getUnitType(String name) {
    return _unitTypes.firstWhere((element) => element.name == name);
  }
}