import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inforce_test_task/core/repository/car_repository.dart';

import 'cars/ui/cars_screen.dart';

void main() {
  Get.put(CarRepository());
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
