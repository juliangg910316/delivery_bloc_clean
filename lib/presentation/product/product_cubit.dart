import 'package:delivary_bloc_clean/data/in_memory_products.dart';
import 'package:delivary_bloc_clean/domain/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductState {
  final Product product;
  final bool selected;

  ProductState(this.product, {this.selected = false});
}

class ProductCubit extends Cubit<List<ProductState>> {
  ProductCubit() : super([]);

  List<ProductState> get selectedProduct =>
      state.where((element) => element.selected).toList();

  Future<void> init() async {
    final list = products.map((e) => ProductState(e)).toList();
    emit(list);
  }

  void addProduct(ProductState productState) {
    final index = state.indexWhere(
        (element) => element.product.name == productState.product.name);
    state[index] =
        ProductState(state[index].product, selected: !productState.selected);
    emit(List<ProductState>.from(state));
  }
}
