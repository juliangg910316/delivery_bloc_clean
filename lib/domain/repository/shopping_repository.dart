import 'package:delivary_bloc_clean/domain/model/product.dart';
import 'package:delivary_bloc_clean/domain/model/product_cart.dart';

abstract class ShoppingRepositoryInterface {
  Future<List<ProductCart>> loadCartProducts();
  Future<List<ProductCart>> addProductToCart(Product product);
  Future<List<ProductCart>> increment(ProductCart productCart);
  Future<List<ProductCart>> decrement(ProductCart productCart);
  Future<List<ProductCart>> removeProductFromCart(ProductCart product);
}
