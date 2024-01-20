import 'package:flutter/material.dart';

class Plant extends StatelessWidget {
  final int id;

  const Plant({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Hero(tag: 'plant$id', child: Image.asset('asset/plant.png'));
  }
}
