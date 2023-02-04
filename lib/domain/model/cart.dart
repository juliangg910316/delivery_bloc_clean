import 'package:delivary_bloc_clean/domain/model/product_cart.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<ProductCart> carts;

  const Cart({this.carts = const <ProductCart>[]});

  double get totalPrice {
    return carts.fold(0, (total, current) => total + current.product.price);
  }

  int get totalItems {
    return carts.fold(0, (total, current) => total + current.quantity);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [carts];

  @override
  String toString() {
    // TODO: implement toString
    return '{carts : $carts}';
  }
}
