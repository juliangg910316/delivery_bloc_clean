import 'package:delivary_bloc_clean/navigator_utils.dart';
import 'package:delivary_bloc_clean/presentation/home/home_screen.dart';
import 'package:delivary_bloc_clean/presentation/login/login_screen.dart';
import 'package:delivary_bloc_clean/presentation/splash/splash_cubit.dart';
import 'package:delivary_bloc_clean/presentation/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(context.read())..init(),
      child: BlocListener<SplashCubit, SplashCubitState>(
        listener: (_, state) {
          switch (state) {
            case SplashCubitState.isLogin:
              pushAndReplaceToPage(context, const HomePage());
              break;
            default:
              pushAndReplaceToPage(context, const LoginPage());
              break;
          }
        },
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: deliveryGradients,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50.0,
                  child: ClipRRect(
                    child: Image.asset('assets/images/logo.jpg'),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Delivery App',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
