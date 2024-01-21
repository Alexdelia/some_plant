import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GrowthPointCounter extends StatelessWidget {
  // TODO: handle huge number
  final int amount;

  const GrowthPointCounter({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    // make a card take full width, but only take 32 height
    // it shows the amount of growth point + the icon aligned to the right
    return Card(
      color: Colors.brown.shade300,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: SizedBox(
          height: 32,
          child: Row(
            children: [
              Text('$amount'),
              SvgPicture.asset('asset/growth_point.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
