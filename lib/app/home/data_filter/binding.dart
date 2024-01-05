import 'package:get/get.dart';

import 'data_filter_logic.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataFilterLogic());
  }
}
