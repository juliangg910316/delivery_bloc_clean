import 'package:delivary_bloc_clean/domain/usecase/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SplashCubitState {
  none,
  isLogin,
  notLogin,
}

class SplashCubit extends Cubit<SplashCubitState> {
  SplashCubit(this._loginUseCase) : super(SplashCubitState.none);

  final LoginUseCase _loginUseCase;

  void init() async {
    try {
      final result = await _loginUseCase.validateSession();
      emit(result ? SplashCubitState.isLogin : SplashCubitState.notLogin);
    } catch (e) {
      emit(SplashCubitState.notLogin);
    }
  }
}
