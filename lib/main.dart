// ignore_for_file: deprecated_member_use

import 'dart:ui' show PointerDeviceKind, window;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/data/data_provider.dart';
import 'package:food_delivery_app/core/data/theme_provider.dart';
import 'package:food_delivery_app/src/screens/splashscreen/splashscreen.dart';
import 'package:food_delivery_app/src/screens/splashscreen/provider/splash_provider.dart';
import 'package:food_delivery_app/utils/extentions.dart';
import 'package:food_delivery_app/utils/theme/theme.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataProvider()),
        ChangeNotifierProvider(create: (context) => SplashScreenProvider()),
        ChangeNotifierProvider(
            create: (context) => ThemeProvider(context.dataProvider)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateThemeMode();
      window.onPlatformBrightnessChanged = _updateThemeMode;
    });
  }

  @override
  void dispose() {
    window.onPlatformBrightnessChanged = null;
    super.dispose();
  }

  void _updateThemeMode() {
    final themeProvider = context.themeProvider;
    themeProvider.updateThemeMode(window.platformBrightness);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return GetMaterialApp(
              scrollBehavior: const MaterialScrollBehavior().copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                },
              ),
              debugShowCheckedModeBanner: false,
              title: 'Fusion Food',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeProvider.themeMode, // Listen to themeProvider
              home: const SplashScreen(),
            );
          },
        );
      },
    );
  }
}
