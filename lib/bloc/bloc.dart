import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_hate_list/bloc/events.dart';
import 'package:personal_hate_list/bloc/states.dart';
import 'package:personal_hate_list/database/database.dart';
import 'package:personal_hate_list/datasource/ds_users.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitState()) {
    on<LoadUsersEvent>(onLoadUsersEvent);
    on<AddUserEvent>(onAddUserEvent);
    on<CleanUsersEvent>(onCleanUsersEvent);
  }

  Future<void> onLoadUsersEvent(
      LoadUsersEvent event, Emitter<UsersState> emit) async {
    emit(UsersInitState());
    final db = await provideDb();
    final usersDs = UsersDatasource(db);
    final users = await usersDs.getUsers();
    emit(UsersLoadedState(users));
  }

  Future<void> onAddUserEvent(
      AddUserEvent event, Emitter<UsersState> emit) async {
    emit(UsersInitState());
    final db = await provideDb();
    final usersDs = UsersDatasource(db);
    usersDs.saveUser(event.user);
    final users = await usersDs.getUsers();
    emit(UsersLoadedState(users));
  }

  Future<void> onCleanUsersEvent(
      CleanUsersEvent event, Emitter<UsersState> emit) async {
    emit(UsersInitState());
    final db = await provideDb();
    final usersDs = UsersDatasource(db);
    await usersDs.cleanAllUsers();
    emit(UsersLoadedState([]));
  }
}
