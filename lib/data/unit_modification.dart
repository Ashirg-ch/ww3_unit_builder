import 'package:ww3_unit_builder/data/supply_category.dart';
import 'package:ww3_unit_builder/data/unlocks.dart';

/// A modification that can be applied to a unit.
class UnitModification {
  /// The name of the modification.
  ///
  /// This is the name that will be displayed to the user.
  /// It should be descriptive and unique.
  final String name;

  /// An optional value that states that applying this modification will change the unit's supply category.
  ///
  /// If this is `null`, the unit's supply category will not be changed.
  /// Additionally, if the unit's supply category is already more expensive than the new one,
  /// the new one will not be applied.
  final SupplyCategory? supplyCategory;

  /// Whether the supply category of the unit should be overridden even if it is more expensive.
  ///
  /// This is intended for modifications that modify the class of the unit to a less expensive one,
  /// such as the BTR-T modification for the T-55A.
  final bool overrideSupplyCategory;

  /// The fixed cost of a modification.
  ///
  /// Most modification have a fixed cost regardless of the unit's base cost.
  ///
  /// If the unit has a relative cost, this must be `null`.
  final int? fixedCost;

  /// The relative cost of a modification.
  ///
  /// Some modifications have a cost that is a percentage of the unit's base cost.
  ///
  /// If the unit has a fixed cost, this must be `null`.
  final double? relativeCost;

  final bool requiresUnlock;

  /// Creates a new unit modification.
  ///
  /// Exactly one of [fixedCost] and [relativeCost] must be `null`.
  UnitModification(
    this.name, {
    this.supplyCategory,
    this.overrideSupplyCategory = false,
    this.fixedCost,
    this.relativeCost,
    this.requiresUnlock = false,
  }) : assert((fixedCost == null) != (relativeCost == null)),
       assert(fixedCost == null || fixedCost >= 0),
       assert(relativeCost == null || relativeCost >= 0) {
    if (requiresUnlock) {
      Unlocks().setUnlocked(name, Unlocks().isUnlocked(name));
    }
  }

  int calculateCost(int unitCost) {
    if (fixedCost != null) {
      return fixedCost!;
    } else {
      return (unitCost * relativeCost!).round();
    }
  }

  factory UnitModification.fromJson(Map<String, dynamic> json) {
    return UnitModification(
      json['name'] as String,
      supplyCategory:
          json['supplyCategory'] == null
              ? null
              : SupplyCategory.fromString(json['supplyCategory'] as String),
      overrideSupplyCategory: json['overrideSupplyCategory'] as bool? ?? false,
      fixedCost: json['fixedCost'] as int?,
      relativeCost: (json['relativeCost'] as num?)?.toDouble(),
      requiresUnlock: json['requiresUnlock'] as bool? ?? false,
    );
  }
}
