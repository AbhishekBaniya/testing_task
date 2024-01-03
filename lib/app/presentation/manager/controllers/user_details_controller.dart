import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/remote/data_sources/remote/get_ud.dart';
import '../../../data/remote/models/user_details_model.dart';

class UserDetailsController extends GetxController {
  //List<UserListModel> ulm = [].obs;

  var udm = <UserDetailsModel>[].obs;
  var isLoading = true.obs;
  var urlAvatar = "".obs, firstName = "".obs, lastName = "".obs, email = "".obs;

  @override
  void onInit() {
    //getData();
    super.onInit();
  }

  void getData({required dynamic index}) {
    GetUserDetails().getUserDetails(
      beforeSend: () {
        log('Before Send');
        //udm.value.clear();
      },
      onSuccess: (data) {
        /*for (int i = 0; i < 1; i++) {
          udm.value.add(data);
        }*/
        udm.value.add(data);

        if (udm.value.length > 1) {
          udm.value.clear();
        }

        urlAvatar.value = data.data!.avatar!;
        firstName.value = data.data!.firstName!;
        lastName.value = data.data!.lastName!;
        email.value = data.data!.email!;

        isLoading.value = false;
        log('On Success Length is ${udm.value.length}');
        log('On Success Data is ${udm.value}');
        update();
      },
      onError: (e) {
        isLoading.value = false;
        log('On Error $e');
        log('${udm.value.length}');
        update();
      },
      count: index,
    );
  }

  String? getAvatar() {
    udm.value.forEach((element) {
      urlAvatar.value = element.data!.avatar!;
    });
    return urlAvatar.value;
  }
}
