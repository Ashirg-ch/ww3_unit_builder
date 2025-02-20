import 'package:ww3_unit_builder/data/shops.dart';
import 'package:ww3_unit_builder/data/supply_category.dart';

class UnitType {
  final String name;
  final int cost;
  final Shops shop;
  final SupplyCategory supplyCategory;

  const UnitType(this.name, this.cost, this.supplyCategory, this.shop);

  factory UnitType.fromJson(Map<String, dynamic> json) {
    return UnitType(
      json['name'] as String,
      json['cost'] as int,
      SupplyCategory.fromString(json['supplyCategory'] as String),
      Shops.fromString(json['shop'] as String),
    );
  }
}
