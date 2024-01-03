import 'package:get/get.dart';
import 'package:testing_user_list_with_api/app/presentation/pages/user_details/user_details_page.dart';

import '../../pages/users_list/users_list_page.dart';

class AppNavigator {
  static void popUntilRoot() => Get.until((route) => route.isFirst);
  static void closeAllDialog() =>
      Get.until((route) => Get.isDialogOpen == false);
  static void toUserDetailsPage({dynamic args}) =>
      Get.to(UserDetailsPage(), arguments: args);
  static void toUserListPage({dynamic args}) =>
      Get.to(UserListPage(), arguments: args);
}
