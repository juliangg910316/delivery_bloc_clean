import 'package:delivary_bloc_clean/data/in_memory_products.dart';
import 'package:delivary_bloc_clean/domain/model/product.dart';
import 'package:delivary_bloc_clean/presentation/cart/bloc/cart_bloc.dart';
import 'package:delivary_bloc_clean/presentation/colors.dart';
import 'package:delivary_bloc_clean/presentation/product/product_cubit.dart';
import 'package:delivary_bloc_clean/presentation/widget/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);

  /* final controller = Get.put<ProductController>(
      ProductController(apiRepositoryInterface: Get.find()));

  final cartController = Get.find<CartController>(); */

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit()..init(),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Product'),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<ProductCubit, List<ProductState>>(
            builder: (context, state) {
              return GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: state.length,
                itemBuilder: (context, index) {
                  final product = state[index].product;
                  return _ItemProduct(
                      product: product,
                      onTap: () {
                        print('ProductScreen OnTap Agregar');
                        context.read<CartBloc>().add(CartItemAdded(product));
                      });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  const _ItemProduct({Key? key, required this.product, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Image.asset(product.image)),
            Expanded(
              child: Column(
                children: [
                  Text(product.name),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    product.description,
                    style: Theme.of(context)
                        .textTheme
                        .overline
                        ?.copyWith(color: MyColors.lightGrey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ),
            DeliveryButton(
              onTap: onTap,
              text: 'Agregar',
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
