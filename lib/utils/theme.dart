import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seven_exam/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  /// Light mode

  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
      backgroundColor: AppColors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    ),
    dialogBackgroundColor: AppColors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      elevation: 8,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: AppColors.white,
      elevation: 6,
    ),
    hintColor: AppColors.C_9E9E9E,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(),
    primaryColorDark: AppColors.white,
    primaryColor: AppColors.white,
    useMaterial3: true,
    cardColor: AppColors.C_246BFD,
    shadowColor: AppColors.C_04060F.withOpacity(0.5),
    textSelectionTheme:
    const TextSelectionThemeData(cursorColor: AppColors.black),
    splashColor: AppColors.C_9E9E9E,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.urbanist(
        textStyle: TextStyle(
            color: AppColors.C_212121,
            fontSize: 57.sp,
            fontWeight: FontWeight.w800),
      ),
      displayMedium: GoogleFonts.urbanist(
        textStyle: TextStyle(
            color: AppColors.C_212121,
            fontSize: 45.sp,
            fontWeight: FontWeight.w700),
      ),
      displaySmall: GoogleFonts.urbanist(
        textStyle: TextStyle(
            color: AppColors.C_212121,
            fontSize: 36.sp,
            fontWeight: FontWeight.w600),
      ),
      headlineMedium: GoogleFonts.urbanist(
        textStyle: TextStyle(
            color: AppColors.C_212121,
            fontSize: 28.sp,
            fontWeight: FontWeight.w500),
      ),
      headlineSmall: GoogleFonts.urbanist(
        textStyle: TextStyle(
            color: AppColors.C_212121,
            fontSize: 24.sp,
            fontWeight: FontWeight.w400),
      ),
      titleLarge: GoogleFonts.urbanist(
        textStyle: TextStyle(
            color: AppColors.C_212121,
            fontSize: 22.sp,
            fontWeight: FontWeight.w300),
      ),
      labelMedium: GoogleFonts.urbanist(
        textStyle: TextStyle(
            color: AppColors.C_212121,
            fontSize: 16.sp,
            fontWeight: FontWeight.w200),
      ),
    ),
  );

  /// Dark mode

  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
      backgroundColor: AppColors.C_181A20,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    ),
    dialogBackgroundColor: AppColors.C_1F222A,
    popupMenuTheme: const PopupMenuThemeData(
      color: AppColors.black,
      elevation: 6,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.C_181A20.withOpacity(0.85),
      elevation: 8,
    ),
    useMaterial3: true,
    splashColor: AppColors.C_04060F,
    hintColor: AppColors.C_9E9E9E,
    cardColor: AppColors.C_246BFD,
    scaffoldBackgroundColor: AppColors.C_181A20,
    primaryColor: AppColors.black,
    colorScheme: const ColorScheme.dark(),
    primaryColorDark: AppColors.black,
    shadowColor: AppColors.C_04060F.withOpacity(0.5),
    textSelectionTheme:
    const TextSelectionThemeData(cursorColor: AppColors.white),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.urbanist(
        textStyle: TextStyle(
            color: AppColors.white,
            fontSize: 57.sp,
            fontWeight: FontWeight.w800),
      ),
      displayMedium: GoogleFonts.urbanist(
        textStyle: TextStyle(
            color: AppColors.white,
            fontSize: 45.sp,
            fontWeight: FontWeight.w700),
      ),
      displaySmall: GoogleFonts.urbanist(
        textStyle: TextStyle(
            color: AppColors.white,
            fontSize: 36.sp,
            fontWeight: FontWeight.w600),
      ),
      headlineMedium: GoogleFonts.urbanist(
        textStyle: TextStyle(
            color: AppColors.white,
            fontSize: 28.sp,
            fontWeight: FontWeight.w500),
      ),
      headlineSmall: GoogleFonts.urbanist(
        textStyle: TextStyle(
            color: AppColors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w400),
      ),
      titleLarge: GoogleFonts.urbanist(
        textStyle: TextStyle(
            color: AppColors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.w300),
      ),
      labelMedium: GoogleFonts.urbanist(
        textStyle: TextStyle(
            color: AppColors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w200),
      ),
    ),
  );
}