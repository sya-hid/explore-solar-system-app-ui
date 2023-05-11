import 'package:explore_solar_system/consts.dart';
import 'package:flutter/material.dart';

class PlanetItem extends StatelessWidget {
  final String image;
  const PlanetItem({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
            color: white.withOpacity(0.2),
            offset: const Offset(0, -10),
            blurStyle: BlurStyle.normal,
            spreadRadius: 5,
            blurRadius: 10),
      ]),
      child: AnimatedContainer(
        width: 620,
        height: 620,
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/$image'), fit: BoxFit.fill)),
      ),
    );
  }
}
