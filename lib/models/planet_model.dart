class PlanetsModel {
  final String? image;
  final String? name;
  final double? size;
  final double? distancefromEarth;
  final int? temperature;
  final int? satellites;
  final double? orbitalSpeed;
  final double? surfaceArea;
  final double? rotationPeriod;

  PlanetsModel(
      {required this.size,
      required this.distancefromEarth,
      required this.image,
      this.temperature,
      this.satellites,
      this.orbitalSpeed,
      this.surfaceArea,
      this.rotationPeriod,
      required this.name});
}

List<PlanetsModel> planets = [
  PlanetsModel(
      image: 'mercury.png',
      name: 'Mercury',
      size: 4879,
      satellites: 0,
      temperature: 167,
      orbitalSpeed: 47.9,
      surfaceArea: 75000000,
      rotationPeriod: 58.6462,
      distancefromEarth: 91691000),
  PlanetsModel(
      image: 'venus.png',
      name: 'Venus',
      size: 12104,
      satellites: 0,
      temperature: 464,
      surfaceArea: 460235000,
      orbitalSpeed: 35.0,
      rotationPeriod: -243.0226,
      distancefromEarth: 41400000),
  PlanetsModel(
      image: 'earth.png',
      name: 'Earth',
      size: 12756,
      surfaceArea: 510065600,
      satellites: 1,
      orbitalSpeed: 29.8,
      temperature: 15,
      rotationPeriod: 0.99726968,
      distancefromEarth: 0),
  PlanetsModel(
      image: 'mars.png',
      name: 'Mars',
      size: 6805,
      surfaceArea: 144800000,
      orbitalSpeed: 24.1,
      rotationPeriod: 1.02595675,
      satellites: 2,
      temperature: -65,
      distancefromEarth: 78340000),
  PlanetsModel(
      image: 'jupiter.png',
      name: 'Jupiter',
      size: 142984,
      orbitalSpeed: 13.1,
      temperature: -110,
      satellites: 95,
      rotationPeriod: 0.41354,
      surfaceArea: 62179600000,
      distancefromEarth: 628730000),
  PlanetsModel(
      image: 'saturn.png',
      name: 'Saturn',
      size: 120536,
      orbitalSpeed: 9.7,
      temperature: -140,
      satellites: 99,
      rotationPeriod: 0.44002,
      surfaceArea: 42612000000,
      distancefromEarth: 1275000000),
  PlanetsModel(
      image: 'uranus.png',
      name: 'Uranus',
      satellites: 27,
      size: 51118,
      temperature: -195,
      surfaceArea: 8084000000,
      orbitalSpeed: 6.8,
      rotationPeriod: -0.71833,
      distancefromEarth: 2723950000),
  PlanetsModel(
      image: 'neptunes.png',
      name: 'Neptunes',
      size: 49528,
      satellites: 14,
      orbitalSpeed: 5.4,
      surfaceArea: 7619000000,
      rotationPeriod: 0.67125,
      temperature: -200,
      distancefromEarth: 4351400000),
  PlanetsModel(
      image: 'pluto.png',
      name: 'Pluto',
      size: 2376.6,
      surfaceArea: 17744430,
      satellites: 5,
      rotationPeriod: -6.38718,
      temperature: -225,
      orbitalSpeed: 4.8,
      distancefromEarth: 7500000000),
];
