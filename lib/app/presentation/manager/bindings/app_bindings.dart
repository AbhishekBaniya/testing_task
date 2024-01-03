import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import '../controllers/user_details_controller.dart';
import '../controllers/user_list_controller.dart';

class AppBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => UserListController());
    Get.lazyPut(() => UserDetailsController());
  }
}
