import 'package:delivary_bloc_clean/domain/model/user.dart';
import 'package:delivary_bloc_clean/domain/repository/api_repository.dart';
import 'package:delivary_bloc_clean/domain/repository/local_storage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileThemeCubit extends Cubit<bool> {
  ProfileThemeCubit(bool state) : super(state);

  void onChangeDarckMode(bool isDark) => emit(isDark);
}

class ProfileState {
  final User user;

  ProfileState(this.user);
}

class ProfileCubit extends Cubit<ProfileState> {
  final LocalRepositoryInterface _localRepositoryInterface;

  ProfileCubit(this._localRepositoryInterface)
      : super(ProfileState(User.empty()));

  void init() async {
    final user = await _localRepositoryInterface.getUser();
    print('init: user $user');
    emit(ProfileState(user));
  }
}

class ProfileLogoutCubit extends Cubit<void> {
  ProfileLogoutCubit(
      this._apiRepositoryInterface, this._localRepositoryInterface)
      : super(null);

  final ApiRepositoryInterface _apiRepositoryInterface;
  final LocalRepositoryInterface _localRepositoryInterface;

  void logOut() async {
    final token = await _localRepositoryInterface.getToken();
    await _apiRepositoryInterface.logout(token!);
    await _localRepositoryInterface.clearAllData();
    emit(null);
  }
}
