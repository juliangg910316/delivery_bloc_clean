import 'package:bloc/bloc.dart';
import 'package:delivary_bloc_clean/domain/repository/api_repository.dart';
import 'package:delivary_bloc_clean/domain/repository/local_storage_repository.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  /* SplashBloc(
      {required this.localRepositoryInterface,
      required this.apiRepositoryInterface})
      : super(SplashInitial()) {
    on<SplashEvent>(_onValidateSession); */
  SplashBloc() : super(SplashInitial()) {
    print('SplashBloc: init');
    //on<ValidateSession>(_onValidateSession);
  }

  /* final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface; */

  void onValidateSession(SplashEvent event, Emitter<SplashState> emit) async {
    print('_onValidateSession: init');
    emit(SplashLoading());
    try {
      Future.delayed(const Duration(seconds: 3));
      //final token = await localRepositoryInterface.getToken();
      /* if (token != null) {
        final user = await apiRepositoryInterface.getUserFromToken(token);
        await localRepositoryInterface.saveUser(user); */
      emit(SplashLoaded(true));
      /* } else {
        emit(SplashLoaded(false));
      } */
    } catch (_) {
      emit(SplashLoaded(false));
    }
  }
}
