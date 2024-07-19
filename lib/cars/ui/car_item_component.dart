import 'package:flutter/material.dart';
import '../../theme/spacing.dart';
import '../model/car_item.dart';

class CarItemComponent extends StatelessWidget {
  final CarItem car;

  const CarItemComponent({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Spacing.small),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Spacing.medium),
        child: Row(
          children: [
            Text(
              car.make,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
