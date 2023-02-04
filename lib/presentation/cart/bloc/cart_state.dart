part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  const CartLoaded(
      {this.cart = const Cart(), this.totalItems = 0, this.totalPrice = 0.0});

  final Cart cart;
  final int totalItems;
  final double totalPrice;

  @override
  List<Object> get props => [cart, totalItems, totalPrice];

  @override
  String toString() {
    // TODO: implement toString
    return 'CartLoaded({cart : $cart , total_items : $totalItems , total_price : $totalPrice})';
  }
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}
