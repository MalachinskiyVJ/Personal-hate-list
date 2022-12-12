import 'package:personal_hate_list/model/user.dart';

abstract class UsersEvent {}

class LoadUsersEvent extends UsersEvent {}

class AddUserEvent extends UsersEvent {
  final User user;

  AddUserEvent(this.user);
}

class CleanUsersEvent extends UsersEvent {}
