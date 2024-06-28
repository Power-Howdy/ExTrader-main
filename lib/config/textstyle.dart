// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static String? primaryColorString = "#4A3EF6";
  static String? secondaryColorString = "#828A99";
  static String? redColorString = "#FF7171";
  static String? greenColorString = "#39CC77";
  static String? lightGrayString = "#F2F2F7";
  static String? darkGrayString = "#1C222E";
  static bool isLightTheme = true;

  static ThemeData getTheme() {
    if (isLightTheme) {
      return lightTheme();
    } else {
      return darkTheme();
    }
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      // headline6: GoogleFonts.manrope(
      //     textStyle: TextStyle(
      //         color: base.headline6!.color,
      //         fontSize: 20,
      //         fontWeight: FontWeight.w500)),
      // subtitle1: GoogleFonts.manrope(
      //     textStyle: TextStyle(color: base.subtitle1!.color, fontSize: 18)),
      // subtitle2: GoogleFonts.manrope(
      //     textStyle: TextStyle(
      //         color: base.subtitle2!.color,
      //         fontSize: 14,
      //         fontWeight: FontWeight.w500)),
      bodySmall: GoogleFonts.manrope(
          textStyle: TextStyle(color: base.bodySmall!.color, fontSize: 16)),
      bodyMedium: GoogleFonts.manrope(
          textStyle: TextStyle(color: base.bodyMedium!.color, fontSize: 14)),
      // button: GoogleFonts.manrope(
      //     textStyle: TextStyle(
      //         color: base.button!.color,
      //         fontSize: 14,
      //         fontWeight: FontWeight.w500)),
      // caption: GoogleFonts.manrope(
      //     textStyle: TextStyle(color: base.caption!.color, fontSize: 12)),
      // headline4: GoogleFonts.manrope(
      //     textStyle: TextStyle(color: base.headline4!.color, fontSize: 34)),
      // headline3: GoogleFonts.manrope(
      //     textStyle: TextStyle(color: base.headline3!.color, fontSize: 48)),
      // headline2: GoogleFonts.manrope(
      //     textStyle: TextStyle(color: base.headline2!.color, fontSize: 60)),
      // headline1: GoogleFonts.manrope(
      //     textStyle: TextStyle(color: base.headline1!.color, fontSize: 96)),
      // headline5: GoogleFonts.manrope(
      //     textStyle: TextStyle(color: base.headline5!.color, fontSize: 24)),
      // overline: GoogleFonts.manrope(
      //     textStyle: TextStyle(color: base.overline!.color, fontSize: 10)),
    );
  }

  static ThemeData lightTheme() {
    Color primaryColor = HexColor(primaryColorString!);
    Color secondaryColor = HexColor(secondaryColorString!);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );

    final ThemeData base = ThemeData.light();
    return base.copyWith(
      appBarTheme: const AppBarTheme(color: Colors.white),
      popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      splashColor: Colors.white.withOpacity(0.1),
      hoverColor: Colors.transparent,
      splashFactory: InkRipple.splashFactory,
      highlightColor: Colors.transparent,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      // backgroundColor: Colors.white,
      // errorColor: Colors.red,
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.textTheme),
      platform: TargetPlatform.iOS,
      indicatorColor: primaryColor,
      disabledColor: HexColor("#FFFFFF"),
    );
  }

  static ThemeData darkTheme() {
    Color primaryColor = HexColor(primaryColorString!);
    Color secondaryColor = HexColor(secondaryColorString!);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
        popupMenuTheme: PopupMenuThemeData(color: HexColor('#12161F')),
        appBarTheme: AppBarTheme(color: HexColor('#12161F')),
        colorScheme: colorScheme,
        primaryColor: primaryColor,
        indicatorColor: Colors.white,
        splashColor: Colors.white24,
        splashFactory: InkRipple.splashFactory,
        canvasColor: Colors.white,
        // backgroundColor: Colors.grey[850],
        scaffoldBackgroundColor: Colors.grey[850],
        buttonTheme: ButtonThemeData(
          colorScheme: colorScheme,
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: _buildTextTheme(base.textTheme),
        primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
        platform: TargetPlatform.iOS,
        disabledColor: HexColor('#1C222E'));
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
