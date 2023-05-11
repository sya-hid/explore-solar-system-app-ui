import 'dart:math';

import 'package:explore_solar_system/consts.dart';
import 'package:explore_solar_system/models/planet_model.dart';
import 'package:explore_solar_system/widgets/detail_planet_item.dart';
import 'package:explore_solar_system/widgets/fade_in_animation.dart';
import 'package:flutter/material.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:dotted_line/dotted_line.dart';

class DetailPage extends StatefulWidget {
  final PlanetsModel planet;
  const DetailPage({super.key, required this.planet});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PlanetsModel planet = widget.planet;
    List<Map<String, dynamic>> details = [
      {
        'icon': 'speed-meter-svgrepo-com.svg',
        'text': 'Average Orbital Speed',
        'value': planet.orbitalSpeed,
        'unit': 'km/s'
      },
      {
        'icon': 'planet-system-1299-svgrepo-com.svg',
        'text': 'Satellites',
        'value': planet.satellites,
        'unit': ''
      },
      {
        'icon': 'compass-svgrepo-com.svg',
        'text': 'Surface Area',
        'value': planet.surfaceArea!.toStringAsFixed(1),
        'unit': 'km2'
      },
      {
        'icon':
            'planet-sustainability-environment-ecology-global-natural-conservation-svgrepo-com.svg',
        'text': 'Rotation Period',
        'value': planet.rotationPeriod,
        'unit': 'd'
      },
    ];
    return Scaffold(
      backgroundColor: darkBlue,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Hero(
              tag: planet.name!,
              child: Material(
                color: transparent,
                child: Column(
                  children: [
                    Text(planet.name!.toUpperCase(),
                        style: const TextStyle(
                            color: white,
                            fontSize: 42,
                            fontFamily: 'Montserrat',
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(
                        planet.name! != 'Earth'
                            ? 'Neighbor'
                            : 'Our Lovely Home',
                        style: const TextStyle(
                            color: white,
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onDoubleTap: () {
                Navigator.of(context).pop();
              },
              child: SizedBox(
                width: size.width,
                height: size.width / 2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Hero(
                      tag: planet.image!,
                      child: Image.asset(
                        'assets/images/${planet.image}',
                        width: size.width / 2,
                        height: size.width / 2,
                      ),
                    ),
                    FadeInAnimation(
                      position: MyAnimation(
                        rightAfter: 100,
                        rightBefore: -70,
                        topAfter: 5,
                        topBefore: 5,
                      ),
                      delayInMs: 500,
                      durationInMs: 250,
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: white.withOpacity(0.2),
                            shape: BoxShape.circle),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.thermostat_rounded,
                              color: white,
                            ),
                            Text(
                              planet.temperature.toString(),
                              style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 1.2,
                                  color: white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width,
              height: 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),
                      const Text('Distance from Earth',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              letterSpacing: 1.2,
                              color: lightBlue,
                              fontWeight: FontWeight.normal)),
                      const SizedBox(height: 2),
                      Text('${planet.distancefromEarth!.toStringAsFixed(0)} km',
                          style: const TextStyle(
                              fontFamily: 'Montserrat',
                              letterSpacing: 1.2,
                              color: lightBlue,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SvgIcon(
                              'assets/svgs/earth.svg',
                              color: lightBlue,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                                child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                const DottedLine(
                                  dashColor: lightBlue,
                                  dashLength: 10,
                                  lineThickness: 2,
                                  dashGapColor: transparent,
                                ),
                                FadeInAnimation(
                                  position: MyAnimation(
                                      leftAfter: 300, leftBefore: 0),
                                  delayInMs: 750,
                                  durationInMs: 1000,
                                  child: Transform.rotate(
                                      angle: 45 * pi / 180,
                                      child: const Icon(
                                          Icons.rocket_launch_rounded,
                                          color: lightBlue)),
                                )
                              ],
                            ))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Stack(
                children: [
                  FadeInAnimation(
                    durationInMs: 250,
                    delayInMs: 500,
                    position: MyAnimation(leftAfter: 0, leftBefore: size.width),
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        colors: [darkBlue, lightBlue],
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                      )),
                      child: Column(
                        children: [
                          ...List.generate(
                              details.length,
                              (index) => Padding(
                                    padding: EdgeInsets.only(
                                        bottom: index == details.length - 1
                                            ? 0
                                            : 16),
                                    child: DetailPlanetItem(
                                        svg:
                                            'assets/svgs/${details[index]['icon']}',
                                        unit: details[index]['unit'],
                                        text: details[index]['text'],
                                        value:
                                            details[index]['value'].toString()),
                                  )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
