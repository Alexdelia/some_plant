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
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.brown.shade200,
                    child: const Column(
                      children: [
                        Text('Plant Stats'),
                      ],
                    ),
                  ),
                ),
                Hero(
                  tag: 'plant$id',
                  child: Image.asset('asset/plant.png'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.brown.shade400,
              child: const Column(
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
