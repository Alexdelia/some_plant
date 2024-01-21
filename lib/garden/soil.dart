import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' show Option;
import 'package:some_plant/garden/plant/widget.dart';
import 'package:some_plant/page/plant.dart';

class Soil extends StatefulWidget {
  final int id;
  final Option<int> level;

  const Soil({super.key, required this.id, required this.level});

  @override
  State<Soil> createState() => _SoilState();
}

class _SoilState extends State<Soil> {
  Option<int> level = const Option<int>.none();

  @override
  void initState() {
    super.initState();
    level = widget.level;
  }

  void onPress() {
    setState(() {
      level = level.fold(
          () => const Option<int>.none(), (l) => Option<int>.of(l + 1));
    });
    _goToPlantPage(context, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: level.fold(
          () => Colors.brown.shade300,
          (l) => Color.lerp(
            Colors.brown.shade200,
            Colors.lightGreen,
            l / 10,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPress,
      child: PlantWidget(id: widget.id),
    );
  }
}

void _goToPlantPage(BuildContext context, int id) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PlantPage(id: id)),
  );
}
