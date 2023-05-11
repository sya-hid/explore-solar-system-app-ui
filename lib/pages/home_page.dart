import 'dart:async';
import 'dart:math';

import 'package:circle_list/circle_list.dart';
import 'package:explore_solar_system/consts.dart';
import 'package:explore_solar_system/models/planet_model.dart';
import 'package:explore_solar_system/pages/detail_page.dart';
import 'package:explore_solar_system/widgets/planet_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int angle = 0;
  int planet1 = 0;
  int planet2 = 0;
  int index = 0;
  String direction = '';
  nextPlanet() {
    if (direction == 'next') {
      if ((currentIndex % planets.length) % 2 == 0) {
        planet2 = planet2 % planets.length + 2;
      } else {
        planet1 = planet1 % planets.length + 2;
      }
    } else {
      setState(() {
        planet2 = currentIndex;
        planet1 = currentIndex;
      });
      if ((currentIndex % planets.length) % 2 == 0) {
        planet1 = currentIndex % planets.length;
        planet2 = (planet2 + 1) % planets.length;
      } else {
        planet1 = (planet1 + 1) % planets.length;
        planet2 = currentIndex % planets.length;
      }
    }
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      var stop = 0;
      index % 2 == 0 ? stop = 360 : stop = 180;
      if (angle.abs() == stop) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          angle += 10;
        });
      }
    });
    setState(() {
      angle.abs() == 360 ? angle = 0 : angle = angle.abs();
      index++;
      currentIndex = index % planets.length;
      direction = 'next';
    });
  }

  prevPlanet() {
    if (direction == 'prev') {
      if ((currentIndex % planets.length) % 2 == 0) {
        planet2 = (planet2 - 1) % planets.length;
      } else {
        planet1 = (planet1 - 1) % planets.length;
      }
    } else {
      setState(() {
        planet2 = currentIndex;
        planet1 = currentIndex;
      });
      if ((currentIndex % planets.length) % 2 == 0) {
        planet1 = currentIndex % planets.length;
        planet2 = (planet2 - 1) % planets.length;
      } else {
        planet1 = (planet1 - 1) % planets.length;
        planet2 = currentIndex % planets.length;
      }
    }
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      var stop = 0;
      index % 2 == 0 ? stop = 0 : stop = 180;
      if (angle.abs() == stop) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          angle -= 10;
        });
      }
    });
    setState(() {
      angle.abs() == 360 ? angle = 0 : angle = angle.abs();
      index--;
      currentIndex = index % planets.length;
      direction = 'prev';
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkBlue,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: white,
                            letterSpacing: 1.2,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Claire Maiden',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            letterSpacing: 1.2,
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.5),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/profile.jpg'),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
            ),
            Positioned(
              top: -300,
              child: CircleList(
                  outerRadius: 836 / 2,
                  innerRadius: 800 / 2,
                  initialAngle: -1.55 - (currentIndex * 0.15),
                  children: List.generate(
                      planets.length * 5,
                      (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == index
                                    ? white.withOpacity(0.3)
                                    : transparent),
                            child: AnimatedContainer(
                              width: 10,
                              height: 10,
                              duration: const Duration(milliseconds: 500),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentIndex == index
                                      ? white
                                      : white.withOpacity(0.3)),
                            ),
                          ))),
            ),
            //planets name
            Positioned(
              top: 220,
              child: AnimatedOpacity(
                duration: const Duration(microseconds: 200),
                curve: Curves.easeInOut,
                opacity: angle.abs() <= 180 && angle.abs() > 0
                    ? angle.abs() / 180
                    : angle.abs() > 180 && angle.abs() <= 360
                        ? angle.abs() / 360
                        : (180 - angle.abs()) / 180,
                child: Hero(
                  tag: planets[currentIndex].name!,
                  child: Material(
                    color: transparent,
                    child: Column(
                      children: [
                        Text(planets[currentIndex].name!.toUpperCase(),
                            style: const TextStyle(
                                color: white,
                                fontFamily: 'Montserrat',
                                letterSpacing: 1.2,
                                fontSize: 42,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Text(currentIndex != 2 ? 'Neighbor' : 'Our Lovely Home',
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
              ),
            ),
            //planets
            Positioned(
              height: 500,
              width: 620,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  currentIndex != 8
                      ? nextPlanet()
                      : ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                              backgroundColor: darkBlue,
                              elevation: 1,
                              margin: EdgeInsets.all(20),
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                'Udah Paling Akhir yaa!!',
                                style: TextStyle(
                                    color: white, fontWeight: FontWeight.bold),
                              )));
                },
                onDoubleTap: () {
                  currentIndex != 0
                      ? prevPlanet()
                      : ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                              backgroundColor: darkBlue,
                              elevation: 1,
                              margin: EdgeInsets.all(20),
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                'Udah Paling Awal yaa!!',
                                style: TextStyle(
                                    color: white, fontWeight: FontWeight.bold),
                              )));
                },
                onLongPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(planet: planets[currentIndex])));
                },
                child: Hero(
                  tag: planets[currentIndex].image!,
                  child: Container(
                    width: 620,
                    color: transparent,
                    child: Transform.rotate(
                      angle: -angle * pi / 180,
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          //1
                          Positioned(
                            width: 620,
                            height: 620,
                            top: 0,
                            child: Transform.rotate(
                              alignment: Alignment.center,
                              angle: -angle * pi / 180,
                              child: AnimatedOpacity(
                                  opacity:
                                      angle.abs() > 180 && angle.abs() <= 360
                                          ? angle.abs() / 360
                                          : angle.abs() < 180
                                              ? (180 - angle.abs()) / 180
                                              : 0,
                                  duration: const Duration(milliseconds: 900),
                                  child: PlanetItem(
                                      image: planets[planet1 % planets.length]
                                          .image!)),
                            ),
                          ),
                          //2
                          Positioned(
                            width: 620,
                            height: 620,
                            // top: 0,
                            bottom: -500,
                            child: Transform.rotate(
                              alignment: Alignment.center,
                              angle: -angle * pi / 180,
                              child: AnimatedOpacity(
                                opacity: angle.abs() > 0 && angle.abs() <= 180
                                    ? angle.abs() / 180
                                    : 0,
                                duration: const Duration(milliseconds: 900),
                                child: PlanetItem(
                                    image: planets[planet2 % planets.length]
                                        .image!),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
