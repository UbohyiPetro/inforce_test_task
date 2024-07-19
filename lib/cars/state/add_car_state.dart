import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddCarState {
  final carMakeController = TextEditingController();
  final RxBool emptyMakeError = RxBool(false);
  final carPriceController = TextEditingController();

  bool addCarTextFieldsIsEmpty() => carMakeController.text.isEmpty;

  void showEmptyMakeError() {
    emptyMakeError.value = true;
  }

  void hideEmptyMakeError() {
    emptyMakeError.value = false;
  }
}
