import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:derived_colors/derived_colors.dart';
import 'package:get/get.dart';
import 'package:restoner_comensales/utils/ui_utils.dart';
export 'package:derived_colors/derived_colors.dart';

const kPrimaryColor = Color(0xFFFF0D4A);
const kSecondaryColor = Color(0xFF222222);
const kSuccessColor = Color(0xFF00E676);
const kInfoColor = Color(0xFF0029FF);
const kErrorColor = Color(0xFFF60814);
const kBackgroundColor = Color(0xFFF9F9F9);
const kSurfaceColor = Color(0xFFFFFFFF);
const kLightColor = Color(0xFFE8E8E8);
const kDarkColor = Color(0xFF979797);

class AppThemes {
  static ThemeData main = ThemeData(
    fontFamily: 'Inter',
    colorScheme: ColorScheme(
      primary: kPrimaryColor,
      primaryVariant: kPrimaryColor.variants.dark,
      secondary: kSecondaryColor,
      secondaryVariant: kSecondaryColor.variants.dark,
      surface: kSurfaceColor,
      background: kBackgroundColor,
      error: kErrorColor,
      onPrimary: kPrimaryColor.onColor,
      onSecondary: kSecondaryColor.onColor,
      onSurface: kSurfaceColor.onColor,
      onBackground: kBackgroundColor.onColor,
      onError: kErrorColor.onColor,
      brightness: Brightness.light,
    ),

    textTheme: const TextTheme(button: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

    dividerTheme: const DividerThemeData(color: kLightColor, thickness: 1),

    cardTheme: const CardTheme(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: kRoundedBorder,
        side: BorderSide(color: kLightColor),
      ),
    ),

    appBarTheme: AppBarTheme(
      titleTextStyle: Get.textTheme.title.copyWith(color: kPrimaryColor),
      actionsIconTheme: const IconThemeData(color: kSecondaryColor),
      color: kSurfaceColor,
      elevation: 0,
    ),

    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: kSurfaceColor,
      isDense: true,
      border: OutlineInputBorder(borderRadius: kRoundedBorder),
    ),
    // inputDecorationTheme: InputDecorationTheme(
    //   labelStyle: const TextStyle(fontSize: 16),
    //   filled: true,
    //   fillColor: kSecondaryColor.variants.light,
    //   border: const UnderlineInputBorder(borderRadius: kRoundedBorder, borderSide: BorderSide.none),
    //   focusedBorder: const OutlineInputBorder(borderRadius: kRoundedBorder, borderSide: BorderSide(color: kPrimaryColor)),
    //   errorBorder: const OutlineInputBorder(borderRadius: kRoundedBorder, borderSide: BorderSide(color: kErrorColor)),
    //   focusedErrorBorder: const OutlineInputBorder(borderRadius: kRoundedBorder, borderSide: BorderSide(color: kErrorColor)),
    //   isDense: true,
    // ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(borderRadius: kRoundedBorder),
        minimumSize: const Size(48, 48),
        elevation: 0,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(borderRadius: kRoundedBorder),
        minimumSize: const Size(48, 48),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(borderRadius: kRoundedBorder),
        minimumSize: const Size(48, 48),
        primary: kSecondaryColor,
      ),
    ),
  );
}

extension CustomStyles on TextTheme {
  TextStyle get title => const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Poppins');
  TextStyle get sub1 => const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle get sub2 => const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  TextStyle get semibold => const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  TextStyle get normal => const TextStyle(fontSize: 16);
  TextStyle get info => const TextStyle(fontSize: 13);
  TextStyle get buttons => const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
}
