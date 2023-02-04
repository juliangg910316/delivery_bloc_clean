import 'package:delivary_bloc_clean/domain/repository/local_storage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppThemeCubit extends Cubit<bool> {
  AppThemeCubit(this._localRepositoryInterface) : super(false);
  final LocalRepositoryInterface _localRepositoryInterface;

  bool _isDark = false;
  bool get isDark => _isDark;

  void init() async {
    _isDark = await _localRepositoryInterface.isDarkMode();
    emit(_isDark);
  }

  Future<void> updateTheme(bool isDarkMode) async {
    _isDark = isDarkMode;
    await _localRepositoryInterface.saveDarkMode(isDarkMode);
    emit(_isDark);
  }
}
