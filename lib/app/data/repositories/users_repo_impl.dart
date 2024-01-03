import 'package:testing_user_list_with_api/app/domain/entities/users_list_entity.dart';

import '../../core/utils/data_state.dart';
import '../../domain/repositories/users_repo.dart';

class UsersRepositoryImpl implements UserRepository {
  //final UserListApiService _userListApiService;
  //final AppDatabase _appDatabase;
  UsersRepositoryImpl(
      /*this._userListApiService*/
      );

  @override
  Future<DataState<List<UserEntity>>> getUserDetails() {
    // TODO: implement getUserDetails
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<UserEntity>>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  /* @override
  Future<DataState<List<UserEntity>>> getUsers() async {


    try {
      final httpResponse =
          await _userListApiService.getUserList(apiKey: '' //newsAPIKey,
              );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            //type: DioErrorType.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }*/
}
