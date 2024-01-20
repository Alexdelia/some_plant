import 'package:flutter/material.dart';

class PlantPage extends StatelessWidget {
  final int id;

  const PlantPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('PlantPage$id'),
      ),
      // body: Hero(
      //   tag: 'plant$id',
      //   child: Image.asset('asset/plant.png'),
      // ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: Column(
                      children: [
                        Text('Plant Stats'),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  child: Hero(
                    tag: 'plant$id',
                    child: Image.asset('asset/plant.png'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: Column(
                children: [
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, sed aliquam nisl nisl eu nisl. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, sed aliquam nisl nisl eu nisl. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, sed aliquam nisl nisl eu nisl. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, sed aliquam nisl nisl eu nisl. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, sed aliquam nisl nisl eu nisl. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, sed aliquam nisl nisl eu nisl.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// screen divided in 2 parts, top and bottom
// top part is divided in two, on the left the stats of the plant, on the right the plant Hero
// bottom part is a lorem ipsum text
