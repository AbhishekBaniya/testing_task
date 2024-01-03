import 'dart:developer';

import 'package:testing_user_list_with_api/app/data/remote/data_sources/remote/api_request.dart';

import '../../../../core/utils/app_constants.dart';
import '../../models/user_details_model.dart';

class GetUserDetails {
  void getUserDetails({
    required Function() beforeSend,
    required Function(UserDetailsModel data) onSuccess,
    required Function(dynamic error) onError,
    required int count,
  }) {
    ApiRequest(url: "${userDetailsListAPIBaseURL}$count", data: {}).get(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        /*onSuccess(
            (data as List).map((e) => UserDetailsModel.fromJson(e)).toList());*/
        log('on ======================> $data');

        onSuccess(UserDetailsModel.fromJson(data));
      },
      onError: (error) {
        {
          if (onError != null) onError(error);
          log('$userDetailsListAPIBaseURL');
        }
      },
    );
  }
}
