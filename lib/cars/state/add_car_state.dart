import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddCarState {
  final carMakeController = TextEditingController();
  final RxBool emptyMakeError = RxBool(false);

  bool carMakeControllerIsEmpty() => carMakeController.text.isEmpty;

  void showEmptyMakeError() {
    emptyMakeError.value = true;
  }

  void hideEmptyMakeError() {
    emptyMakeError.value = false;
  }
}
