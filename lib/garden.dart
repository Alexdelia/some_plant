import 'package:flutter/material.dart';

typedef Soil = int;
typedef GardenT = List<List<Soil>>;

class Garden extends StatefulWidget {
  const Garden({Key? key}) : super(key: key);

  @override
  State<Garden> createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  final GardenT _garden = [
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
  ];

  static const _padding = 8.0;

  void _incrementCell(int row, int col) {
    setState(() {
      _garden[row][col]++;
    });
  }

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

    final soil = _garden[row][col];

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
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Color.lerp(
              Colors.brown.shade200,
              Colors.lightGreen,
              soil / 10,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () => _incrementCell(row, col),
          child: Text(soil.toString()),
        ),
      ),
    );
  }
}
