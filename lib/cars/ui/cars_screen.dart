import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inforce_test_task/cars/controller/car_controller.dart';
import 'package:inforce_test_task/cars/ui/car_item_component.dart';
import 'package:inforce_test_task/theme/spacing.dart';

class CarsScreen extends StatelessWidget {
  const CarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CarController carController = Get.put(CarController());
    return Obx(
      () => Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(Spacing.medium),
          child: FloatingActionButton(
            elevation: 0,
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.medium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                carController.carState.cars.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: carController.carState.cars.length,
                          itemBuilder: (BuildContext context, int index) {
                            var car = carController.carState.cars[index];
                            return CarItemComponent(car: car);
                          },
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
