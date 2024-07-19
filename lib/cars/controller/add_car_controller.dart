import 'package:get/get.dart';
import 'package:inforce_test_task/cars/controller/car_controller.dart';
import 'package:inforce_test_task/cars/state/add_car_state.dart';

import '../model/car_item.dart';

class AddCarController {
  final CarController carController = Get.find();
  final AddCarState addCarState = AddCarState();

  void addCar(CarItem carItem) {
    carController.carState.cars.add(carItem);
  }
}
