import '../../core/utils/data_state.dart';
import '../../core/utils/use_case.dart';
import '../entities/users_list_entity.dart';
import '../repositories/users_repo.dart';

class GetUserDetailsUseCase
    implements UseCase<DataState<List<UserEntity>>, void> {
  final UserRepository _userRepository;

  GetUserDetailsUseCase(this._userRepository);

  @override
  Future<DataState<List<UserEntity>>> call({void params}) =>
      _userRepository.getUserDetails();
}
