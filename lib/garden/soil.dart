import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' show Option;
import 'package:some_plant/garden/plant/class.dart';
import 'package:some_plant/garden/plant/widget.dart';
import 'package:some_plant/page/plant.dart';

class Soil extends StatefulWidget {
  final int index;
  final Option<Plant> plant;
  final void Function(int index, Plant plant) spawnPlant;

  const Soil({
    super.key,
    required this.index,
    required this.plant,
    required this.spawnPlant,
  });

  @override
  State<Soil> createState() => _SoilState();
}

class _SoilState extends State<Soil> {
  void onPress() {
    widget.plant.fold(
      () => _openSoilLens(context, widget.index, widget.spawnPlant),
      (plant) => _goToPlantPage(context, plant.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: widget.plant.fold(
          () => Colors.brown.shade300,
          (p) => Color.lerp(
            Colors.brown.shade200,
            Colors.lightGreen,
            p.level / 10,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPress,
      child: widget.plant.fold(() => null, (p) => PlantWidget(plant: p)),
    );
  }
}

void _goToPlantPage(BuildContext context, int id) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PlantPage(id: id)),
  );
}

void _openSoilLens(BuildContext context, int index,
    void Function(int index, Plant plant) spawnPlant) {
  spawnPlant(index, Plant(id: index, name: 'plant $index'));
}
