/// The various supply categories that units can belong to.
///
/// The supply unit count is the number of supply units that a unit costs or provides.
enum SupplyCategory {
  footSoldier(-1),
  // TODO: The paratrooper modification will require special handling.
  paratrooperSpecialForces(-2),
  engineerTechnicalSpecialist(-3),
  handheldDrone(-2),
  tacticalDrone(-10),
  maleDrone(-25),
  haleDrone(-50),
  attackHelicopter(-100),
  ifvApc(-25),
  lightTankTankDestroyer(-30),
  mbt(-50),
  selfPropelledMortars(-30),
  towedHowitzersAndMRLs(-40),
  selfPropelledGun(-70),
  mlrs(-100),
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
  otherShips(0),
  animal(0),
  lightVehicleMrap(0),
  engineeringVehicles(0);

  final int supplyUnitCount;

  const SupplyCategory(this.supplyUnitCount);
}
