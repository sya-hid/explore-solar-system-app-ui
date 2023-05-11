import 'dart:math';

import 'package:explore_solar_system/consts.dart';
import 'package:explore_solar_system/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: -100,
            top: -70,
            bottom: 0,
            right: -90,
            child: Container(
              transformAlignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          darkBlue.withOpacity(0.4), BlendMode.darken),
                      image: const AssetImage(
                          'assets/images/earth_splash_screen.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: white,
                            fontSize: 52,
                            fontWeight: FontWeight.normal),
                        children: [
                      TextSpan(
                        text: 'EXPLORE ',
                      ),
                      TextSpan(
                          text: 'SOLAR SYSTEM',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ])),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    color: white,
                    size: 32,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
