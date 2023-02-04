import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:delivary_bloc_clean/presentation/cart/bloc/cart_bloc.dart';
import 'package:delivary_bloc_clean/presentation/cart/cart_screen.dart';
import 'package:delivary_bloc_clean/presentation/colors.dart';
import 'package:delivary_bloc_clean/presentation/home/bloc/home_bloc.dart';
import 'package:delivary_bloc_clean/presentation/home/home_cubit.dart';
import 'package:delivary_bloc_clean/presentation/product/product_screen.dart';
import 'package:delivary_bloc_clean/presentation/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(context.read())..add(CartStarted()),
        ),
      ],
      child: BlocBuilder<HomeBloc, int>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: state,
                children: [
                  SafeArea(child: ProductPage()),
                  SafeArea(child: CartPage(onShopping: () {
                    //controller.setIndex(0);
                  })),
                  const SafeArea(
                    child: Center(
                      child: Text('3'),
                    ),
                  ),
                  SafeArea(
                    child: ProfilePage(),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: CurvedNavigationBar(
              //index: controller.indexBarNavigation,
              height: 60,
              items: [
                const Icon(
                  Icons.home,
                  color: MyColors.white,
                ),
                /* Icon(
                  Icons.shopping_basket,
                  color: MyColors.white,
                ), */
                BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                  if (state is CartLoaded && state.cart.carts.isNotEmpty) {
                    return Stack(
                      children: [
                        const SizedBox(
                          height: 45,
                          width: 45,
                        ),
                        const Positioned(
                          right: 0,
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: Icon(
                            Icons.shopping_basket,
                            color: MyColors.white,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.pink,
                            child: Text('${state.totalItems}'),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Icon(
                      Icons.shopping_basket,
                      color: MyColors.white,
                    );
                  }
                }),
                const Icon(
                  Icons.graphic_eq_sharp,
                  color: MyColors.white,
                ),
                const Icon(
                  Icons.person,
                  color: MyColors.white,
                ),
              ],
              color: Theme.of(context).bottomAppBarColor,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              buttonBackgroundColor: MyColors.purple,
              onTap: (index) =>
                  context.read<HomeBloc>().add(ChangeIndex(index)),
            ),
          );
        },
      ),
    );
  }
}
