import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' show Option;
import 'package:some_plant/garden/plant/class.dart';
import 'package:some_plant/garden/soil.dart';

typedef SoilT = Option<Plant>;
typedef GardenT = List<List<SoilT>>;

class Garden extends StatefulWidget {
  const Garden({super.key});

  @override
  State<Garden> createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  final int gardenSize = 4;

  GardenT _createGarden() {
    return List.generate(
        gardenSize, (_) => List.filled(gardenSize, const Option<Plant>.none()));
  }

  GardenT _garden = [];

  @override
  void initState() {
    super.initState();
    _garden = _createGarden();
  }

  void spawnPlant(int index, Plant plant) {
    final row = index ~/ _garden.length;
    final col = index % _garden.length;

    setState(() {
      _garden[row][col] = Option<Plant>.of(plant);
    });
  }

  static const _padding = 8.0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          // wood like background texture
          decoration: const BoxDecoration(
            color: Colors.brown,
          ),
          child: Padding(
            padding: const EdgeInsets.all(_GardenState._padding),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _garden.length,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: _buildGridItem,
              itemCount: _garden.length * _garden[0].length,
            ),
          ),
        ));
  }

  Widget _buildGridItem(BuildContext context, int index) {
    final row = index ~/ _garden.length;
    final col = index % _garden.length;

    final plant = _garden[row][col];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            const BoxShadow(
              color: Colors.black,
            ),
            BoxShadow(
              color: Colors.brown.shade200,
              spreadRadius: -12,
              blurRadius: 12,
            ),
          ],
        ),
        child: Soil(index: index, plant: plant, spawnPlant: spawnPlant),
      ),
    );
  }
}
