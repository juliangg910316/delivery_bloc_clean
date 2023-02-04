import 'package:delivary_bloc_clean/presentation/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/* class CustomTheme {
  static ThemeData get lightTheme {
    //1
    return ThemeData(
        //2
        primaryColor: Colors.greenAccent,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat', //3
        iconTheme: const IconThemeData(color: Colors.greenAccent),
        //inputDecorationTheme: InputDecorationTheme(),
        buttonTheme: ButtonThemeData(
          // 4
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.green,
          /* colorScheme: ColorScheme(
              primary: Colors.green,
              primaryVariant: Colors.greenAccent,
              secondary: Colors.grey,
              secondaryVariant: Colors.blueGrey,
              /* surface: surface,
              background: background,
              error: error,
              onPrimary: onPrimary,
              onSecondary: onSecondary,
              onSurface: onSurface,
              onBackground: onBackground,
              onError: onError,
              brightness: brightness */), */
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: Colors.grey,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Montserrat',
        textTheme: ThemeData.dark().textTheme,
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.lightGreen,
        ));
  }
} */

final _borderLight = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    color: MyColors.veryLightGrey,
    width: 2,
    style: BorderStyle.solid,
  ),
);

final _borderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    color: MyColors.grey,
    width: 1,
    style: BorderStyle.solid,
  ),
);

final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
      color: MyColors.white,
      titleTextStyle: TextStyle(
        color: MyColors.purple,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      )),
  canvasColor: MyColors.white,
  accentColor: MyColors.purple,
  bottomAppBarColor: MyColors.lightGrey,
  scaffoldBackgroundColor: MyColors.white,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: MyColors.purple,
    displayColor: MyColors.purple,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: _borderLight,
    enabledBorder: _borderLight,
    focusedBorder: _borderLight,
    contentPadding: EdgeInsets.zero,
    labelStyle: const TextStyle(color: MyColors.purple),
    hintStyle: GoogleFonts.poppins(color: MyColors.lightGrey, fontSize: 10),
  ),
  iconTheme: IconThemeData(
    color: MyColors.purple,
  ),
);

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
      color: MyColors.purple,
      titleTextStyle: TextStyle(
        color: MyColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      )),
  canvasColor: MyColors.grey,
  accentColor: MyColors.white,
  scaffoldBackgroundColor: MyColors.dark,
  bottomAppBarColor: MyColors.grey,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: MyColors.green,
    displayColor: MyColors.green,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: _borderDark,
    enabledBorder: _borderDark,
    focusedBorder: _borderDark,
    labelStyle: TextStyle(color: MyColors.white),
    contentPadding: EdgeInsets.zero,
    fillColor: MyColors.grey,
    filled: true,
    hintStyle: GoogleFonts.poppins(color: MyColors.white, fontSize: 10),
  ),
  iconTheme: IconThemeData(
    color: MyColors.white,
  ),
);

final deliveryGradients = [MyColors.green, MyColors.purple];
