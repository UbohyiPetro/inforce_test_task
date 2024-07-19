import 'package:dio/dio.dart';
import 'package:inforce_test_task/core/repository/model/car_api.dart';

class CarRepository {
  final _carsRequestUrl = "https://freetestapi.com/api/v1/cars";
  final _dio = Dio();

  Future<List<CarApi>> fetchCars() async {
    final response = await _dio.get(_carsRequestUrl);
    final List<CarApi> cars = (response.data as List)
        .map((carJson) => CarApi.fromJson(carJson))
        .toList();
    return cars;
  }
}
