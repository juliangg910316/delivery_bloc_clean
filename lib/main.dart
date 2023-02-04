import 'package:delivary_bloc_clean/dependecies.dart';
import 'package:delivary_bloc_clean/presentation/splash/splash_screen.dart';
import 'package:delivary_bloc_clean/presentation/theme.dart';
import 'package:delivary_bloc_clean/presentation/theme_cubit.dart';
import 'package:delivary_bloc_clean/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: buildRepositories(),
      child: BlocProvider(
        create: (context) => AppThemeCubit(context.read()),
        child: BlocBuilder<AppThemeCubit, bool>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state ? darkTheme : lightTheme,
              home: const SplashPage(),
            );
          },
        ),
      ),
    );
  }
}
