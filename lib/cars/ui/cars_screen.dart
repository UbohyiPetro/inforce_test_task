import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inforce_test_task/cars/controller/add_car_controller.dart';
import 'package:inforce_test_task/cars/controller/car_controller.dart';
import 'package:inforce_test_task/cars/mapper/car_mapper.dart';
import 'package:inforce_test_task/cars/model/car_local.dart';
import 'package:inforce_test_task/cars/ui/car_item_component.dart';
import 'package:inforce_test_task/theme/spacing.dart';

class CarsScreen extends StatelessWidget {
  const CarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CarController carController = Get.put(CarController());
    deleteConfirmationDialog(int carId) => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Are you sure?"),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  carController.deleteCar(carId);
                  Get.back();
                },
                child: const Text("Yes"),
              ),
            ],
          );
        });
    openAddCarDialog() => showDialog(
          context: context,
          builder: (context) {
            final AddCarController addCarController =
                Get.put(AddCarController());
            final addCarState = addCarController.addCarState;
            return Obx(
              () => AlertDialog(
                title: const Text("Add Car"),
                content: TextField(
                  controller: addCarState.carMakeController,
                  decoration: addCarState.emptyMakeError.value
                      ? const InputDecoration(
                          hintText: "Enter car make",
                          errorText: "Field is empty",
                        )
                      : const InputDecoration(
                          hintText: "Enter car make",
                        ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      addCarState.hideEmptyMakeError();
                      Get.back();
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      if (addCarState.carMakeControllerIsEmpty()) {
                        addCarState.showEmptyMakeError();
                        return;
                      }
                      CarLocal carLocal = CarLocal(
                        id: DateTime.now().second,
                        make: addCarState.carMakeController.text,
                      );
                      addCarController.addCar(carLocal.toCarItem());
                      Get.back();
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            );
          },
        );
    return Obx(
      () => Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(Spacing.medium),
          child: carController.carState.cars.isNotEmpty
              ? FloatingActionButton(
                  elevation: 0,
                  onPressed: openAddCarDialog,
                  child: const Icon(Icons.add),
                )
              : null,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              right: Spacing.medium,
              left: Spacing.medium,
              top: Spacing.medium,
              bottom: Spacing.bottomFloatingActionButton,
            ),
            child: carController.carState.cars.isNotEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: DropdownButton<String>(
                          icon: const Padding(
                            padding: EdgeInsets.all(Spacing.small),
                            child: Icon(Icons.sort),
                          ),
                          value: carController.currentSortOption.value,
                          onChanged: (Object? value) {
                            carController.onChangedSortOption(value as String);
                          },
                          items: carController.sortOptions
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: carController.carState.cars.length,
                          itemBuilder: (BuildContext context, int index) {
                            var car = carController.carState.cars[index];
                            return CarItemComponent(
                              car: car,
                              onPressed: () {
                                deleteConfirmationDialog(car.id);
                              },
                            );
                          },
                        ),
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ),
    );
  }
}
