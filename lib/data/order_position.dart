import 'package:ww3_unit_builder/data/modifications_list.dart';
import 'package:ww3_unit_builder/data/supply_category.dart';
import 'package:ww3_unit_builder/data/unit_modification.dart';
import 'package:ww3_unit_builder/data/unit_type.dart';
import 'package:ww3_unit_builder/data/unit_type_list.dart';
import 'package:ww3_unit_builder/data/unlocks.dart';

class OrderPosition {
  final UnitType _unitType;
  final List<UnitModification> _modifications;
  final int count;

  const OrderPosition(
    this.count,
    this._unitType, {
    List<UnitModification> modifications = const [],
  }) : _modifications = modifications,
       assert(count > 0);

  factory OrderPosition.fromJson(Map<String, dynamic> json) {
    try {
      return OrderPosition(
        json['count'] as int,
        UnitTypeList().getUnitType(json['name'] as String),
        modifications:
            (json['modifications'] as List?)
                ?.map((e) => ModificationsList().getModification(e))
                .toList() ??
            const [],
      );
    } catch (e) {
      print('Error parsing OrderPosition from JSON: $json\nError: $e');
      rethrow;
    }
  }

  UnitType get unitType => _unitType;

  List<UnitModification> get modifications => List.unmodifiable(_modifications);

  int get totalCost {
    return _unitType.cost * count +
        getUnlockedModifications().fold(
          0,
          (sum, mod) => sum + mod.calculateCost(_unitType.cost) * count,
        );
  }

  SupplyCategory get supplyCategory {
    SupplyCategory supplyCategory = _unitType.supplyCategory;
    for (final mod in getUnlockedModifications()) {
      if (mod.supplyCategory != null &&
          mod.supplyCategory!.supplyUnitCount >
              supplyCategory.supplyUnitCount) {
        supplyCategory = mod.supplyCategory!;
      }
    }
    return supplyCategory;
  }

  int get totalSupply {
    SupplyCategory supplyCategory = this.supplyCategory;

    return supplyCategory.supplyUnitCount * count;
  }

  /// Check whether this order position describes the same unit as another.
  ///
  /// If the positions are equal, they can be combined into a single order position.
  ///
  /// Two order positions are considered equal if they have the same unit type and modifications.
  /// The count is not considered.
  bool equals(OrderPosition other) {
    List thisUnlockedMods = getUnlockedModifications();
    List otherUnlockedMods = other.getUnlockedModifications();
    return _unitType == other._unitType &&
        thisUnlockedMods.length == otherUnlockedMods.length &&
        thisUnlockedMods.every((mod) => otherUnlockedMods.contains(mod));
  }

  List<UnitModification> getUnlockedModifications() {
    return _modifications
        .where((mod) => !mod.requiresUnlock || Unlocks().isUnlocked(mod.name))
        .toList();
  }

  @override
  String toString() {
    String mods = _modificationsToString();
    return '${count}x ${_unitType.name}$mods';
  }

  String _modificationsToString() {
    List<UnitModification> mods = getUnlockedModifications();

    if (mods.isEmpty) return '';

    return '\n- ${mods.map((e) => e.name).join('\n- ')}';
  }
}
