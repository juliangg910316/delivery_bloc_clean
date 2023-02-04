import 'package:delivary_bloc_clean/domain/model/product.dart';
import 'package:delivary_bloc_clean/domain/model/product_cart.dart';
import 'package:delivary_bloc_clean/domain/repository/shopping_repository.dart';

class ShoppingRepositoryImpl extends ShoppingRepositoryInterface {
  List<ProductCart> _cartProducts = [];

  @override
  Future<List<ProductCart>> addProductToCart(Product product) async {
    final temp = List<ProductCart>.from(_cartProducts);
    bool found = false;
    for (ProductCart p in temp) {
      if (p.product.name == product.name) {
        p.quantity += 1;
        found = true;
        break;
      }
    }
    if (!found) {
      temp.add(ProductCart(product: product));
    }
    _cartProducts = List<ProductCart>.from(temp);
    return _cartProducts;
  }

  @override
  Future<List<ProductCart>> increment(ProductCart productCart) async {
    productCart.quantity += 1;
    _cartProducts = List<ProductCart>.from(_cartProducts);
    return _cartProducts;
  }

  @override
  Future<List<ProductCart>> decrement(ProductCart productCart) async {
    if (productCart.quantity > 1) {
      productCart.quantity -= 1;
    }
    _cartProducts = List<ProductCart>.from(_cartProducts);
    return _cartProducts;
  }

  @override
  Future<List<ProductCart>> loadCartProducts() async {
    print('loadCartProducts: cart = ${_cartProducts.length}');
    return _cartProducts;
  }

  @override
  Future<List<ProductCart>> removeProductFromCart(ProductCart product) async {
    _cartProducts.remove(product);
    return _cartProducts;
  }
}
