import 'package:dio/dio.dart';

class CarRepository {
  final _carsRequestUrl = "https://freetestapi.com/api/v1/cars";
  final _dio = Dio();

  void fetchCars() async {
    final response = await _dio.get(_carsRequestUrl);
    // TODO: map response to app car models
  }
}
