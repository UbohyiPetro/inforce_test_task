import 'package:flutter/material.dart';
import '../../theme/spacing.dart';
import '../model/car_item.dart';

class CarItemComponent extends StatelessWidget {
  final CarItem car;
  final VoidCallback onPressed;
  const CarItemComponent({super.key, required this.car, required this.onPressed});

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
            Expanded(
              child: Text(
                car.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              onPressed: onPressed,
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
