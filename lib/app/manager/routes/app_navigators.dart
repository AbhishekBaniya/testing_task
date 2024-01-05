import 'package:get/get.dart';

class AppNavigator {
  static void popUntilRoot() => Get.until((route) => route.isFirst);
  static void closeAllDialog() =>
      Get.until((route) => Get.isDialogOpen == false);
  /*static void toUserDetailsPage({dynamic args}) =>
      Get.to(UserDetailsPage(), arguments: args);
  static void toUserListPage({dynamic args}) =>
      Get.to(UserListPage(), arguments: args);*/
}
