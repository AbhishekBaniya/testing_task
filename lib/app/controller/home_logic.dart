import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  //final HomeState state = HomeState();

  var num = 0.obs;
  var filterIndex = 1.obs;
  var filterSearchController = TextEditingController().obs;
  var data = ["Mathew", "Deon", "Sara", "Yeu"].obs;
  var userChecked = [].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void increment() => num.value += 1;

  void decrement() => num.value == 0 ? num.value : num.value -= 1;

  void setIndex(dynamic value) => filterIndex.value = value;

  void onSelected(bool selected, String dataName) => selected == true
      ? userChecked.value.add(dataName)
      : userChecked.value.remove(dataName);
}
