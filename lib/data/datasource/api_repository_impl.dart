import 'package:delivary_bloc_clean/data/in_memory_products.dart';
import 'package:delivary_bloc_clean/domain/exception/auth_exception.dart';
import 'package:delivary_bloc_clean/domain/model/product.dart';
import 'package:delivary_bloc_clean/domain/model/user.dart';
import 'package:delivary_bloc_clean/domain/repository/api_repository.dart';
import 'package:delivary_bloc_clean/domain/response/login_response.dart';
import 'package:delivary_bloc_clean/domain/request/login_request.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 3));
    if (token == 'AA111') {
      return const User(
          name: 'Julian Gutierrez',
          username: 'juliangg',
          image: 'assets/images/user.png');
    } else if (token == 'AA222') {
      return const User(
          name: 'Elon Musk',
          username: 'elonmusk',
          image: 'assets/images/elon_musk.jpg');
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    await Future.delayed(const Duration(seconds: 3));
    if (login.username == 'julian' && login.password == 'guti') {
      return LoginResponse(
        'AA111',
        const User(
          name: 'Julian Gutierrez',
          username: 'juliangg',
          image: 'assets/images/user.png',
        ),
      );
    } else if (login.username == 'elon' && login.password == 'musk') {
      return LoginResponse(
        'AA222',
        const User(
          name: 'Elon Musk',
          username: 'elonmusk',
          image: 'assets/images/elon_musk.jpg',
        ),
      );
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('removing token from server: $token');
  }

  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 3));
    return products;
  }
}
