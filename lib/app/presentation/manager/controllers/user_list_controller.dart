import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/remote/data_sources/remote/get_ul.dart';
import '../../../data/remote/models/user_list_model.dart';

class UserListController extends GetxController {
  //List<UserListModel> ulm = [].obs;
  //var _mainData = [].obs;

  //get mainData => _mainData;

  RxList<UserListModel> myList = <UserListModel>[].obs;

  var ulm = <UserListModel>[].obs;
  var isLoading = true.obs;
  var page = 0.obs,
      perPage = 0.obs,
      total = 0.obs,
      totalPage = 0.obs,
      counter = 2.obs;
  var isSelected = false.obs;
  var buttonText = "Press Here To See The Change".obs;

  @override
  void onInit() {
    getData(index: 1);
    super.onInit();
  }

  void getData({int? index}) {
    GetUserList().getPostsList(
      beforeSend: () => log('Before Send'),
      onSuccess: (data) {
        if (index == 3) {
          for (int i = 0; i < 1; i++) {
            ulm.value.add(data);
            ulm.refresh();
            update();
          }
        } else {
          for (int i = 0; i < data.data!.length; i++) {
            ulm.value.add(data);
            ulm.refresh();
            update();
          }
        }

        page.value = data.perPage!;
        total.value = data.total!;
        perPage.value = data.perPage!;

        log("Perpage Is : ${data.perPage!}");
        log("total Is : ${data.total!}");
        log("totalPage Is : ${data.totalPages!}");
        log("Page Is : ${data.page!}");

        isLoading.value = false;
        log('On Success Length is ${ulm.value.length}');
        log('On Success Data is ${ulm.value}');
        update();
      },
      onError: (e) {
        isLoading.value = false;
        log('On Error $e');
        log('${ulm.value.length}');
        update();
      },
      count: index,
    );
  }

  void getNextData({required GetxController controller}) {
    var data = isSelected.value = !isSelected.value;
    //var data = counter.value++;

    switch (data) {
      case true:
        ulm.value.clear();
        getData(index: 2);
        buttonText.value = "Load Previous";
        controller.refresh();
        break;

      case false:
        ulm.value.clear();
        getData(index: 1);
        buttonText.value = "Load Next";
        controller.refresh();
        break;

      default:
        print(' invalid entry $data');
    }
  }

  /*void getNextData() {


    if (page.value == 1) {
      counter.value++;
      ulm.value.clear();
      getData(index: counter.value);
      update();
    } else i

    else {

      ulm.value.clear();
      getData(index: 2);
      update();
    }
  }*/
}
