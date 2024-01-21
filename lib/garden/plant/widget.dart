import 'package:flutter/material.dart';
import 'package:some_plant/garden/plant/class.dart';

class PlantWidget extends StatelessWidget {
  final Plant plant;

  const PlantWidget({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Hero(tag: 'plant${plant.id}', child: Image.asset('asset/plant.png'));
  }
}
