import 'package:delivary_bloc_clean/navigator_utils.dart';
import 'package:delivary_bloc_clean/presentation/home/home_screen.dart';
import 'package:delivary_bloc_clean/presentation/login/login_cubit.dart';
import 'package:delivary_bloc_clean/presentation/theme.dart';
import 'package:delivary_bloc_clean/presentation/widget/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const logoSize = 40.0;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const moreSize = 50.0;
    return BlocProvider(
      create: (context) => LoginCubit(context.read(), context.read()),
      child: BlocConsumer<LoginCubit, LoginState>(listener: (_, state) {
        print('LoginScreen: $state');
        if (state == LoginState.loadedSucces) {
          pushAndReplaceToPage(context, const HomePage());
        }
        if (state == LoginState.loadedError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Error en el login'),
              //padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height - 100,
                  right: 20,
                  left: 20),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              dismissDirection: DismissDirection.up,
              elevation: 30,
              backgroundColor: Colors.grey.withOpacity(0.8),
              //animation: CurvedAnimation(parent: AnimationController(vsync: this), curve: Curves.easeIn),
            ),
          );
        }
      }, builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: logoSize,
                          left: -moreSize / 2,
                          right: -moreSize / 2,
                          height: moreSize + size.width,
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: deliveryGradients,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: const [0.5, 1.0],
                                ),
                                borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(200))),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).canvasColor,
                            radius: 50.0,
                            child: ClipRRect(
                              child: Image.asset(
                                'assets/images/logo.jpg',
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Username',
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .inputDecorationTheme
                                            .labelStyle
                                            ?.color,
                                      ),
                              textAlign: TextAlign.start,
                            ),
                            TextField(
                              controller: context
                                  .read<LoginCubit>()
                                  .usernameTextController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                hintText: 'username',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Password',
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .inputDecorationTheme
                                            .labelStyle
                                            ?.color,
                                      ),
                              textAlign: TextAlign.start,
                            ),
                            TextField(
                              controller: context
                                  .read<LoginCubit>()
                                  .passwordTextController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                hintText: 'password',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: DeliveryButton(
                        onTap: () {
                          context.read<LoginCubit>().login();
                        },
                        text: 'Login'),
                  ),
                ],
              ),
              Positioned.fill(
                  child: state == LoginState.loading
                      ? Container(
                          color: Colors.black26,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : const SizedBox.shrink()),
            ],
          ),
        );
      }),
    );
  }
}
