import 'package:get/get.dart';
import 'package:inforce_test_task/cars/mapper/car_mapper.dart';
import 'package:inforce_test_task/core/repository/car_repository.dart';

import '../state/car_state.dart';

class CarController extends GetxController {
  final CarState carState = CarState();
  final CarRepository _carRepository = Get.find();
  final currentSortOption = "Alphabetic".obs;
  final List<String> sortOptions = ['Alphabetic', 'Price'];

  @override
  void onInit() {
    getCars();
    super.onInit();
  }

  void getCars() async {
    var carsApi = await _carRepository.fetchCars();
    carState.cars.value = carsApi.map((car) => car.toCarItem()).toList();
  }

  void deleteCar(int id) {
    carState.cars.removeWhere((car) => car.id == id);
  }

  void onChangedSortOption(String sortOption) {
    currentSortOption.value = sortOption;
    if (sortOption == sortOptions[0]) {
      carState.cars.sort((a, b) {
        return a.make.toLowerCase().compareTo(b.make.toLowerCase());
      });
    } else {
      carState.cars.sort((a, b) {
        return a.make.toLowerCase().compareTo(b.make.toLowerCase());
      });
    }
  }
}
