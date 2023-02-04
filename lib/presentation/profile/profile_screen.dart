import 'package:delivary_bloc_clean/navigator_utils.dart';
import 'package:delivary_bloc_clean/presentation/colors.dart';
import 'package:delivary_bloc_clean/presentation/login/login_screen.dart';
import 'package:delivary_bloc_clean/presentation/profile/profile_cubit.dart';
import 'package:delivary_bloc_clean/presentation/theme.dart';
import 'package:delivary_bloc_clean/presentation/theme_cubit.dart';
import 'package:delivary_bloc_clean/presentation/widget/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              ProfileThemeCubit(context.read<AppThemeCubit>().isDark),
        ),
        BlocProvider(
          create: (context) =>
              ProfileLogoutCubit(context.read(), context.read()),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(context.read())..init(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Center(child: Text('Profile'))),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state) {
                          final image = state.user.image;
                          return ClipRRect(
                            child: Image.asset(image),
                            borderRadius: BorderRadius.circular(50.0),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      final name = state.user.name;
                      return Text(
                        '$name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Card(
                      color: Theme.of(context).canvasColor,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Personal Information',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              'Username',
                              style: TextStyle(
                                color: MyColors.green,
                              ),
                            ),
                            BlocBuilder<ProfileCubit, ProfileState>(
                              builder: (context, state) {
                                final username = state.user.username;
                                return Text(
                                  '$username',
                                  style: const TextStyle(
                                    color: MyColors.lightGrey,
                                  ),
                                );
                              },
                            ),
                            Row(
                              children: [
                                const Text('Dark Mode'),
                                const Spacer(),
                                BlocBuilder<ProfileThemeCubit, bool>(
                                  builder: (context, state) => Switch(
                                    value: state, //controller.isDark.value,
                                    onChanged: (val) {
                                      context
                                          .read<ProfileThemeCubit>()
                                          .onChangeDarckMode(val);
                                      context
                                          .read<AppThemeCubit>()
                                          .updateTheme(val);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Builder(builder: (context) {
                      return BlocListener<ProfileLogoutCubit, void>(
                        listener: (context, state) {
                          popAllAndPush(context, LoginPage());
                        },
                        child: DeliveryButton(
                          onTap: () {
                            context.read<ProfileLogoutCubit>().logOut();
                          },
                          text: 'Log Out',
                          padding: const EdgeInsets.all(10.0),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
