import 'package:delivary_bloc_clean/presentation/colors.dart';
import 'package:delivary_bloc_clean/presentation/widget/delivery_button.dart';
import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  final VoidCallback onShopping;
  const EmptyCart({Key? key, required this.onShopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Icon(
          Icons.shopping_cart_outlined,
          size: 80.0,
          color: MyColors.green,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'There are no products',
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: DeliveryButton(
            onTap: onShopping,
            text: 'Go shopping',
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
          ),
        ),
      ],
    );
  }
}
