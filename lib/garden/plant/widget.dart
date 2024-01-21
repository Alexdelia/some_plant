import 'package:flutter/material.dart';

class PlantWidget extends StatelessWidget {
  final int id;

  const PlantWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Hero(tag: 'plant$id', child: Image.asset('asset/plant.png'));
  }
}
