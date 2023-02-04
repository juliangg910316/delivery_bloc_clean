part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartItemAdded extends CartEvent {
  const CartItemAdded(this.product);

  final Product product;

  @override
  List<Object> get props => [product];
}

class CartItemIncrement extends CartEvent {
  const CartItemIncrement(this.productCart);

  final ProductCart productCart;

  @override
  List<Object> get props => [productCart];
}

class CartItemDecrement extends CartEvent {
  const CartItemDecrement(this.productCart);

  final ProductCart productCart;

  @override
  List<Object> get props => [productCart];
}

class CartItemRemoved extends CartEvent {
  const CartItemRemoved(this.product);

  final ProductCart product;

  @override
  List<Object> get props => [product];
}
