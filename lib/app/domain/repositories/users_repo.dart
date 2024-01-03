import 'package:testing_user_list_with_api/app/domain/entities/users_list_entity.dart';

import '../../core/utils/data_state.dart';

abstract class UserRepository {
  // API methods
  Future<DataState<List<UserEntity>>> getUsers();

  Future<DataState<List<UserEntity>>> getUserDetails();

  // Database methods
  //Future<List<ArticleEntity>> getSavedArticles();

  //Future<void> saveArticle(ArticleEntity article);

  //Future<void> removeArticle(ArticleEntity article);
}
