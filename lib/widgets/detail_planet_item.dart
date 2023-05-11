import 'package:explore_solar_system/consts.dart';
import 'package:flutter/material.dart';
import 'package:svg_icon/svg_icon.dart';

class DetailPlanetItem extends StatelessWidget {
  final String svg, text, value, unit;
  const DetailPlanetItem({
    super.key,
    required this.svg,
    required this.text,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
          color: lightBlue2, borderRadius: BorderRadius.circular(40)),
      child: Row(
        children: [
          SvgIcon(
            svg,
            color: white,
          ),
          const SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: white,
                  fontFamily: 'Montserrat',
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '$value $unit',
                style: const TextStyle(
                    color: white,
                    fontFamily: 'Montserrat',
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
