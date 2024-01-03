import 'package:equatable/equatable.dart';

import '../../data/remote/models/user_list_model.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? email, firstName, lastName, avatar;
  final int? page, perPage, total, totalPages;
  final List<Data>? user_data;

  const UserEntity(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.avatar,
      this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.user_data});

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        avatar,
        page,
        perPage,
        total,
        totalPages,
        user_data,
      ];
}
