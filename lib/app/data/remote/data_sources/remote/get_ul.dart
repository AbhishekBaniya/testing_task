import 'dart:developer';

import 'package:testing_user_list_with_api/app/data/remote/data_sources/remote/api_request.dart';
import 'package:testing_user_list_with_api/app/data/remote/models/user_list_model.dart';

import '../../../../core/utils/app_constants.dart';

class GetUserList {
  void getUserList(
      {required Function() beforeSend,
      required Function(List<UserListModel> ul) onSuccess,
      required Function(dynamic error) onError}) {
    ApiRequest(url: userListAPIBaseURL, data: {
      //"page": queryParam,
    }).get(
        beforeSend: () => {beforeSend()},
        onSuccess: (data) => log(
            "dataYeHai ${data.map((e) => log('dataYeHai : $e'))}") //UserListModel.fromJson(data)
        /*onSuccess(
                */ /*(data.json.decode(data)
                as Map<String, dynamic>)[
            "data"]*/ /*
                (data).map((e) => UserListModel.fromJson(e)))*/
        ,
        onError: (error) => {onError(error)});
  }

  void getPostsList({
    required Function() beforeSend,
    required Function(UserListModel data) onSuccess,
    required Function(dynamic error) onError,
    required int? count,
  }) {
    ApiRequest(url: "${userListAPIBaseURL}$count", data: {}).get(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        log('on ======================> $data');

        onSuccess(UserListModel.fromJson(data));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
