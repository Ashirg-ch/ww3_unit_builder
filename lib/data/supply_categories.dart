/// The various supply categories that units can belong to.
///
/// The supply unit count is the number of supply units that a unit costs or provides.
enum SupplyCategory {
  /// Common foot soldiers includes the following types:
  /// - conscript/paramilitary/reservist
  /// - soldier
  /// - marine
  /// - medic
  /// - heavy weapons trooper
  /// - sniper
  footSoldier(-1),
  // TODO: The paratrooper modification will require special handling.
  /// All types of Special Forces/Special Operation Forces,
  /// as well as paratroopers regardless of type
  /// (unless they fall under the even more expensive category of [engineerTechnicalSpecialist]).
  paratrooperSpecialForces(-2),

  /// Combat engineers and technical specialists.
  engineerTechnicalSpecialist(-3),

  /// Light drones, such as quadcopters.
  handheldDrone(-2),
  tacticalDrone(-10),

  /// Medium-altitude long endurance (MALE) drones.
  ///
  /// Examples:
  /// - General Atomics MQ-1 Predator
  /// - Baykar Bayraktar TB2
  maleDrone(-25),

  /// High-altitude long endurance (HALE) drones.
  ///
  /// Example: Northrop Grumman RQ-4 Global Hawk.
  haleDrone(-50),

  /// Attack helicopters and gunships.
  ///
  /// This also includes armed helicopters that can be used for transport,
  /// such as the Mil Mi-24 Hind or the Mil Mi-8 Hip.
  attackHelicopter(-100),

  /// Infantry fighting vehicles (IFVs) and armored personnel carriers (APCs).
  ///
  /// Examples:
  /// - M113
  /// - Piranha V
  /// - BMR-600
  /// - M2 Bradley
  /// - CV90
  /// - BMP-3
  ifvApc(-25),

  /// Light tanks and tank destroyers.
  ///
  /// Examples:
  /// - ZTQ-15
  /// - M1128 Mobile Gun System
  /// - M1134 ATGM Vehicle
  /// - Centauro 155/39LW
  lightTankTankDestroyer(-30),

  /// Main battle tanks (MBTs).
  ///
  /// Examples:
  /// - M60 Patton
  /// - T-72
  /// - M1 Abrams
  /// - Leopard 2
  /// - Merkava Mk IV
  /// - Type 99
  mbt(-50),

  /// Self-propelled mortars.
  ///
  /// This category does not include towed/carried mortars, nor howitzers or MLRS.
  ///
  /// Examples:
  /// - 2S9
  /// - PPZ-10
  /// - M1064
  selfPropelledMortars(-30),

  /// Towed howitzers and Multiple Rocket Launchers (MRLs).
  ///
  /// Examples:
  /// - M777
  /// - Type 63 MRL
  /// - L118 light gun
  /// - M119
  towedHowitzersAndMRLs(-40),

  /// Self-propelled howitzers.
  ///
  /// Examples:
  /// - M109
  /// - PzH 2000
  /// - PLZ-45
  /// - CAESAR 8x8
  selfPropelledGun(-70),

  /// Self-propelled Multiple Launch Rocket Systems (MLRS).
  ///
  /// Examples:
  /// - M270
  /// - M142 HIMARS
  /// - BM-30 Smerch
  /// - PHL-03
  mlrs(-100),

  /// Surface-to-surface missile systems.
  ///
  /// Examples:
  /// - Land-based NSM
  /// - YJ-12B
  /// - DF-100
  surfaceToSurfaceMissile(-100),
  ballisticMissile(-150),
  cRamSpaag(-30),
  shortRangeSam(-35),
  mediumRangeSam(-45),
  longRangeSam(-70),
  abmSam(-90),
  counterBatteryBattlefieldSurveillanceRadars(-10),
  surveillanceTrackingRadars(-25),
  othRadar(-60),
  electronicWarfareSystem(-40),
  lightUtilityVehicle(40),
  heavyUtilityVehicle(70),
  fuelTanker(80),
  transportHelicopter(60),
  tacticalAirLifter(350),
  strategicAirLifter(600),
  landingCraft(500),
  cargoSupplyShip(5000),

  /// Non-transport planes are not included in the supply count system due to being base-dependent.
  otherAircraft(0),

  /// Ships carry their own supplies and resupply at bases.
  otherShips(0),

  /// Animals could be used for both transport and combat,
  /// and are therefore considered neutral per staff judgement.
  animal(0),
  lightVehicleMrap(0),
  engineeringVehicles(0);

  /// The number of supply units that a unit costs or provides.
  ///
  /// Negative values indicate that the unit costs supply units,
  /// while positive values indicate that the unit provides supply units.
  final int supplyUnitCount;

  const SupplyCategory(this.supplyUnitCount);
}
