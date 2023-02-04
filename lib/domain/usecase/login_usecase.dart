import 'package:delivary_bloc_clean/domain/repository/api_repository.dart';
import 'package:delivary_bloc_clean/domain/repository/local_storage_repository.dart';

class LoginUseCase {
  final ApiRepositoryInterface apiRepositoryInterface;
  final LocalRepositoryInterface localRepositoryInterface;

  LoginUseCase(this.apiRepositoryInterface, this.localRepositoryInterface);

  Future<bool> validateSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      final user = await apiRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      return true;
    } else {
      return false;
    }
  }
}
