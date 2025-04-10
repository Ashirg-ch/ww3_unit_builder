import 'package:ww3_unit_builder/data/shops.dart';
import 'package:ww3_unit_builder/data/supply_category.dart';
import 'package:ww3_unit_builder/data/unit_type.dart';

enum Discounts {
  militaryAcademy({_Presets.infantry: 10}),
  shipyard({_Presets.ships: 10}),
  tankFactory({_Presets.armouredFightingVehicles: 10}, _ResearchMode.both),
  aircraftAssemblyComplex({_Presets.allAircraft: 10}),
  naturalGasProcessingComplex({_Presets.engineeringAndLogisticsVehicles: 10}),
  researchLaboratories({_Presets.all: 10}, _ResearchMode.researchOnly),
  aviationAce({_Presets.combatAircraft: 5, _Presets.nonCombatAircraft: 10});

  const Discounts(
    this._supplyCategories, [
    this._researchMode = _ResearchMode.normalOnly,
  ]);

  final Map<Set<SupplyCategory>, int> _supplyCategories;
  final _ResearchMode _researchMode;

  /// Get the discount in percent for the given unit.
  /// If this discount does not apply to the unit, it returns 0.
  int getDiscount(UnitType unit) {
    if (!_researchMode.appliesToUnit(unit)) {
      return 0;
    }

    for (final entry in _supplyCategories.entries) {
      if (entry.key.contains(unit.supplyCategory)) {
        return entry.value;
      }
    }
    return 0;
  }
}

/// Whether the discount applies to research shop units, normal units, or both.
enum _ResearchMode {
  /// Does not apply to research units.
  normalOnly,

  /// Applies to research units.
  both,

  /// Applies to research units only.
  researchOnly;

  /// Check whether a discount with this mode applies to the given unit.
  bool appliesToUnit(UnitType unit) {
    switch (this) {
      case _ResearchMode.normalOnly:
        return unit.shop != Shops.research;
      case _ResearchMode.both:
        return true;
      case _ResearchMode.researchOnly:
        return unit.shop == Shops.research;
    }
  }
}

abstract class _Presets {
  static const infantry = {
    SupplyCategory.footSoldier,
    SupplyCategory.paratrooperSpecialForces,
    SupplyCategory.engineerTechnicalSpecialist,
  };

  static const combatAircraft = {
    SupplyCategory.handheldDrone,
    SupplyCategory.tacticalDrone,
    SupplyCategory.maleDrone,
    SupplyCategory.haleDrone,
    SupplyCategory.attackHelicopter,
    SupplyCategory.otherCombatAircraft,
  };

  static const nonCombatAircraft = {
    SupplyCategory.otherAircraft,
    SupplyCategory.transportHelicopter,
    SupplyCategory.tacticalAirLifter,
    SupplyCategory.strategicAirLifter,
  };

  static const allAircraft = {...combatAircraft, ...nonCombatAircraft};

  static const ships = {
    SupplyCategory.otherShips,
    SupplyCategory.cargoSupplyShip,
    SupplyCategory.landingCraft,
  };

  static const armouredFightingVehicles = {
    SupplyCategory.ifvApc,
    SupplyCategory.lightTankTankDestroyer,
    SupplyCategory.mbt,
  };

  static const logisticsVehicles = {
    SupplyCategory.lightUtilityVehicle,
    SupplyCategory.heavyUtilityVehicle,
    SupplyCategory.fuelTanker,
  };

  static const engineeringAndLogisticsVehicles = {
    SupplyCategory.engineeringVehicle,
    ...logisticsVehicles,
  };

  static const all = {...SupplyCategory.values};
}
