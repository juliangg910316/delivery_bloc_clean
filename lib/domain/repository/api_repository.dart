import 'package:delivary_bloc_clean/domain/model/product.dart';
import 'package:delivary_bloc_clean/domain/model/user.dart';
import 'package:delivary_bloc_clean/domain/request/login_request.dart';
import 'package:delivary_bloc_clean/domain/response/login_response.dart';

abstract class ApiRepositoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest login);
  Future<void> logout(String token);
  Future<List<Product>> getProducts();
}
