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
  ///
  /// This also covers the equipment used by these soldiers,
  /// such as HMGs, Mortars, ATGMs, MANPADS, and other handheld equipment.
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

  /// Ballistic missile systems, including short-range ballistic missiles (SRBMs).
  ///
  /// Examples:
  /// - Iskander
  /// - DF-15
  /// - DF-17
  /// - DF-21D
  ballisticMissile(-150),

  /// C-RAM and SPAAG systems.
  ///
  /// Examples:
  /// - Centurion C-RAM
  /// - MANTIS C-RAM
  /// - ZSU-23-4MP
  /// - Gepard
  cRamSpaag(-30),

  /// Short-range SAM systems, including SAM-equipped SPAAGs.
  ///
  /// This category does not include MANPADS,
  /// which are treated as equipment for foot soldiers.
  ///
  /// Examples:
  /// - 9K22 Tunguska
  /// - Multi Mission Launcher
  /// - AN/TWQ 1 Avenger
  /// - FK-1000
  /// - NASAMS 1
  shortRangeSam(-35),

  /// Medium-range SAM systems.
  ///
  /// Examples:
  /// - NASAMS 2
  /// - HQ-16
  /// - Buk
  mediumRangeSam(-45),

  /// Long-range SAM systems.
  ///
  /// Examples:
  /// - SAMP/T
  /// - MEADS
  /// - PAC-2
  /// - PAC-3
  /// - HQ-9
  longRangeSam(-70),

  /// Anti-ballistic missile (ABM) systems.
  ///
  /// Examples:
  /// - THAAD
  /// - HQ-19
  /// - S-400
  abmSam(-90),

  /// Counter-battery radars and battlefield surveillance radars.
  ///
  /// Examples:
  /// - ARTHUR
  /// - AN/TPQ-36(V)8
  counterBatteryBattlefieldSurveillanceRadars(-10),

  /// Surveillance radars and tracking radars.
  ///
  /// Examples:
  /// - AN/TPQ-5
  /// - JY-14
  surveillanceTrackingRadars(-25),

  /// Over the horizon radars (OTH).
  ///
  /// Examples:
  /// - NOSTRADAMUS
  /// - Container
  othRadar(-60),

  /// Dedicated electronic warfare systems.
  ///
  /// Examples:
  /// - LAV-MEWSS
  /// - Borisoglebsk 2
  /// - Krasukha 4
  electronicWarfareSystem(-40),

  /// Light utility vehicles and trucks, used for transport and logistics.
  ///
  /// Examples:
  /// - FMTV
  /// - M939
  /// - M54 cargo truck
  /// - Ural-4320
  lightUtilityVehicle(40),

  /// Heavy utility vehicles and trucks, used for transport and logistics.
  ///
  /// Examples:
  /// - HEMTT
  /// - M1074 PLS
  /// - M1070
  /// - MAN SX44
  /// - Unipower M-series
  heavyUtilityVehicle(70),

  /// Dedicated fuel tankers.
  ///
  /// Examples:
  /// - Scania CaRAPACE
  /// - Oshkosh Wheeled Tanker
  fuelTanker(80),

  /// Transport helicopters.
  ///
  /// This category includes helicopters that are slightly armed (machine guns, miniguns),
  /// but are primarily used for transport.
  ///
  /// Examples:
  /// - UH-60 Black Hawk
  /// - AW101
  /// - Z-8
  /// - CH-47
  transportHelicopter(60),

  /// Tactical airlifters.
  ///
  /// Examples:
  /// - C-130J
  /// - C-160
  /// - C-295
  /// - Y-9
  tacticalAirLifter(350),

  /// Strategic airlifters.
  ///
  /// Examples:
  /// - C-17
  /// - Y-20
  /// - A-400M
  /// - An-124
  strategicAirLifter(600),

  /// Naval landing craft.
  ///
  /// Examples:
  /// - Zubr
  /// - LCAC
  /// - LCM-8
  landingCraft(500),

  /// Cargo ships and dedicated supply ships.
  ///
  /// Examples:
  /// - Supply-class
  /// - Berlin-class
  cargoSupplyShip(5000),

  /// Non-transport planes are not included in the supply count system due to being base-dependent.
  otherAircraft(0),

  /// Non-transport ships use a different system for their supplies.
  otherShips(0),

  /// Animals could be used for both transport and combat,
  /// and are therefore considered neutral per staff judgement.
  animal(0),

  /// Light vehicles, such as MRAPs.
  ///
  /// They are not included in the supply count system,
  /// because they're constrained by more limited capabilities.
  lightVehicleMrap(0),

  /// Engineering vehicles, such as bulldozers and mine-clearing vehicles,
  engineeringVehicle(0);

  /// The number of supply units that a unit costs or provides.
  ///
  /// Negative values indicate that the unit costs supply units,
  /// while positive values indicate that the unit provides supply units.
  final int supplyUnitCount;

  const SupplyCategory(this.supplyUnitCount);

  /// Returns the supply category that corresponds to the given string.
  ///
  /// Throws an [ArgumentError] if the string does not correspond to any supply category.
  static SupplyCategory fromString(String string) {
    return SupplyCategory.values.firstWhere(
      (e) => e.toString() == 'SupplyCategory.$string',
      orElse: () => SupplyCategory.lightVehicleMrap//throw ArgumentError('Invalid supply category: $string'),
    );
  }

  bool get consumesSupply => supplyUnitCount < 0;

  bool get providesSupply => supplyUnitCount > 0;
}
