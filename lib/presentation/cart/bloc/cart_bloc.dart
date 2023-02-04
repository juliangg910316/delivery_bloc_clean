import 'package:bloc/bloc.dart';
import 'package:delivary_bloc_clean/domain/model/cart.dart';
import 'package:delivary_bloc_clean/domain/model/product.dart';
import 'package:delivary_bloc_clean/domain/model/product_cart.dart';
import 'package:delivary_bloc_clean/domain/repository/shopping_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(this.shoppingRepositoryInterface) : super(CartLoading()) {
    on<CartStarted>(_onStarted);
    on<CartItemAdded>(_onItemAdded);
    on<CartItemRemoved>(_onItemRemoved);
    on<CartItemIncrement>(_onIncrement);
    on<CartItemDecrement>(_onDecrement);
  }

  final ShoppingRepositoryInterface shoppingRepositoryInterface;

  void _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    print('_onStarted init');
    try {
      final products = await shoppingRepositoryInterface.loadCartProducts();
      await _calculateTotalsLoaded(products, emit);
    } catch (_) {
      emit(CartError());
    }
  }

  void _onItemAdded(CartItemAdded event, Emitter<CartState> emit) async {
    final state = this.state;
    print('_onItemAdded state = $state');

    try {
      final products =
          await shoppingRepositoryInterface.addProductToCart(event.product);
      await _calculateTotalsLoaded(products, emit);
    } catch (_) {
      emit(CartError());
    }
  }

  void _onIncrement(CartItemIncrement event, Emitter<CartState> emit) async {
    final state = this.state;
    print('_onIncrement state = $state');

    try {
      final products =
          await shoppingRepositoryInterface.increment(event.productCart);
      await _calculateTotalsLoaded(products, emit);
    } catch (_) {
      emit(CartError());
    }
  }

  void _onDecrement(CartItemDecrement event, Emitter<CartState> emit) async {
    final state = this.state;
    print('_onDecrement state = $state');

    try {
      final products =
          await shoppingRepositoryInterface.decrement(event.productCart);
      await _calculateTotalsLoaded(products, emit);
    } catch (_) {
      emit(CartError());
    }
  }

  void _onItemRemoved(CartItemRemoved event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        final products = await shoppingRepositoryInterface
            .removeProductFromCart(event.product);
        await _calculateTotalsLoaded(products, emit);
      } catch (_) {
        emit(CartError());
      }
    }
  }

  Future<void> _calculateTotalsLoaded(
      List<ProductCart> products, Emitter<CartState> emit) async {
    print('_onStarted: product = ${products.length}');
    final int total = products.fold(
        0, (previousValue, element) => element.quantity + previousValue);
    final double totalCost = products.fold(
        0.0,
        (previousValue, element) =>
            (element.quantity * element.product.price) + previousValue);
    emit(
      CartLoaded(
        cart: Cart(carts: [...products]),
        totalItems: total,
        totalPrice: totalCost,
      ),
    );
  }
}
