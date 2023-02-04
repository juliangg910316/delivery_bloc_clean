import 'package:delivary_bloc_clean/domain/model/product_cart.dart';
import 'package:delivary_bloc_clean/presentation/cart/bloc/cart_bloc.dart';
import 'package:delivary_bloc_clean/presentation/cart/cart_empty_screen.dart';
import 'package:delivary_bloc_clean/presentation/colors.dart';
import 'package:delivary_bloc_clean/presentation/widget/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  final VoidCallback onShopping;
  const CartPage({Key? key, required this.onShopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Shopping Cart')),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const CircularProgressIndicator();
          } else if (state is CartLoaded && state.totalItems > 0) {
            return _FullCart(
              productsCart: state.cart.carts,
              totalPrice: state.totalPrice,
            );
          } else {
            return EmptyCart(onShopping: onShopping);
          }
        },
      ),
    );
  }
}

class _FullCart extends StatelessWidget {
  const _FullCart(
      {Key? key, required this.productsCart, required this.totalPrice})
      : super(key: key);

  final List<ProductCart> productsCart;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ListView.builder(
              itemCount: productsCart.length,
              itemExtent: 230,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final productCart = productsCart[index];
                return _ShoppingCartProduct(
                  productCart: productCart,
                );
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Theme.of(context).canvasColor,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub total',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                color: Theme.of(context).accentColor,
                              ),
                        ),
                        Text(
                          '0.0 usd',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                color: Theme.of(context).accentColor,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                color: Theme.of(context).accentColor,
                              ),
                        ),
                        Text(
                          'free',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                color: Theme.of(context).accentColor,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${totalPrice.toStringAsFixed(2)} USD',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    DeliveryButton(onTap: () {}, text: 'Checkout'),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _ShoppingCartProduct extends StatelessWidget {
  final ProductCart productCart;

  _ShoppingCartProduct({
    Key? key,
    required this.productCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = productCart.product;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Card(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: Image.asset(product.image)),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(product.name),
                        const SizedBox(
                          height: 10,
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
                          height: 10,
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: MyColors.white,
                              ),
                              child: InkWell(
                                child: const Icon(
                                  Icons.remove,
                                  color: MyColors.purple,
                                ),
                                onTap: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartItemDecrement(productCart));
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('${productCart.quantity}'),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: MyColors.purple,
                              ),
                              child: InkWell(
                                child: const Icon(
                                  Icons.add,
                                  color: MyColors.white,
                                ),
                                onTap: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartItemIncrement(productCart));
                                },
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '\$${product.price}',
                              style: const TextStyle(
                                color: MyColors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {
                print('ProductScreen OnTap Eliminar');
                context.read<CartBloc>().add(CartItemRemoved(productCart));
              },
              child: CircleAvatar(
                backgroundColor: MyColors.pink,
                child: Icon(Icons.delete_outline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
