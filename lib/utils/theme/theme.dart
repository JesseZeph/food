import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/utils/app_color.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white, elevation: 0.h),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 20.0,
      fontFamily: 'Karla',
      color: AppColor.mainTextColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'Karla',
      color: AppColor.mainTextColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'Karla',
      color: AppColor.mainTextColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Karla',
      color: AppColor.mainTextColor,
    ),
    displaySmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Karla',
      color: AppColor.mainTextColor,
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.black,
  iconTheme: const IconThemeData(color: Colors.white),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black, elevation: 0.h),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 20.0,
      fontFamily: 'Karla',
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'Karla',
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'Karla',
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Karla',
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Karla',
      color: Colors.white,
    ),
  ),
);
