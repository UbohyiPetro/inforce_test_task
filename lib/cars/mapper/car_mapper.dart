import 'package:inforce_test_task/cars/model/car_item.dart';
import 'package:inforce_test_task/cars/model/car_local.dart';
import 'package:inforce_test_task/core/repository/model/car_api.dart';

extension CarApiToCarItem on CarApi {
  CarItem toCarItem() {
    return CarItem(
      id: id,
      name: '$make $model',
      price: price,
    );
  }
}

extension CarLocalToCarItem on CarLocal {
  CarItem toCarItem() {
    return CarItem(
      id: id,
      name: make,
      price: price,
    );
  }
}
