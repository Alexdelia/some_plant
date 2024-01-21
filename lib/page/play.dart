import 'package:flutter/material.dart';
import 'package:some_plant/garden/mod.dart';
import 'package:some_plant/rest.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('PlayPage'),
      ),
      body: const _PositionManager(
        children: [
          SizedBox(child: Garden()),
          Expanded(child: Rest()),
        ],
      ),
    );
  }
}

class _PositionManager extends StatelessWidget {
  const _PositionManager({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? Column(
                children: children,
              )
            : Row(
                children: children,
              );
      },
    );
  }
}
