import 'package:get/get.dart';
import 'package:inforce_test_task/cars/mapper/car_mapper.dart';
import 'package:inforce_test_task/core/repository/car_repository.dart';

import '../state/car_state.dart';

class CarController extends GetxController {
  final CarState carState = CarState();
  final CarRepository _carRepository = Get.find();

  @override
  void onInit() {
    getCars();
    super.onInit();
  }

  void getCars() async {
    var cars_api = await _carRepository.fetchCars();
    carState.cars.value = cars_api.map((car) => car.toCarItem()).toList();
  }
}