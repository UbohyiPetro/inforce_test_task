import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cars/ui/cars_screen.dart';

void main() {
  runApp(const InforceTestTask());
}

class InforceTestTask extends StatelessWidget {
  const InforceTestTask({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: CarsScreen(),
    );
  }
}
