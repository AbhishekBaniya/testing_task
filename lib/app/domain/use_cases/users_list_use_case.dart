import 'package:testing_user_list_with_api/app/domain/entities/users_list_entity.dart';

import '../../core/utils/data_state.dart';
import '../../core/utils/use_case.dart';
import '../repositories/users_repo.dart';

class GetUserListUseCase implements UseCase<DataState<List<UserEntity>>, void> {
  final UserRepository _userRepository;

  GetUserListUseCase(this._userRepository);

  @override
  Future<DataState<List<UserEntity>>> call({void params}) =>
      _userRepository.getUsers();
}
