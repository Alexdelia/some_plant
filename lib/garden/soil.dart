import 'package:flutter/material.dart';
import 'package:some_plant/garden/plant.dart';
import 'package:some_plant/page/plant.dart';

class Soil extends StatefulWidget {
  final int id;
  final int level;

  const Soil({super.key, required this.id, required this.level});

  @override
  State<Soil> createState() => _SoilState();
}

class _SoilState extends State<Soil> {
  int level = 0;

  @override
  void initState() {
    super.initState();
    level = widget.level;
  }

  void onPress() {
    setState(() {
      level++;
    });
    _goToPlantPage(context, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Color.lerp(
          Colors.brown.shade200,
          Colors.lightGreen,
          level / 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPress,
      child: Plant(id: widget.id),
    );
  }
}

void _goToPlantPage(BuildContext context, int id) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PlantPage(id: id)),
  );
}
