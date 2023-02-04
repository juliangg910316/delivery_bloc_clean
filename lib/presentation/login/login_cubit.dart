import 'package:delivary_bloc_clean/domain/repository/api_repository.dart';
import 'package:delivary_bloc_clean/domain/repository/local_storage_repository.dart';
import 'package:delivary_bloc_clean/domain/request/login_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum LoginState {
  initial,
  loading,
  loadedSucces,
  loadedError,
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._apiRepositoryInterface, this._localRepositoryInterface)
      : super(LoginState.initial);

  final ApiRepositoryInterface _apiRepositoryInterface;
  final LocalRepositoryInterface _localRepositoryInterface;

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void login() async {
    emit(LoginState.loading);
    final username = usernameTextController.text;
    final password = passwordTextController.text;
    print('LoginCubit: $username $password');
    try {
      final loginResponse =
          await _apiRepositoryInterface.login(LoginRequest(username, password));
      await _localRepositoryInterface.saveToken(loginResponse.token);
      await _localRepositoryInterface.saveUser(loginResponse.user);
      emit(LoginState.loadedSucces);
    } catch (e) {
      emit(LoginState.loadedError);
    }
  }
}
