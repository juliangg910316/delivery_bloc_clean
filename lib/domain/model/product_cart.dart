import 'package:delivary_bloc_clean/domain/model/product.dart';

class ProductCart {
  Product product;
  int quantity;

  ProductCart({required this.product, this.quantity = 1});

  @override
  String toString() {
    return '{product : $product , quantity : $quantity}';
  }
}
