import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/core/data/data_provider.dart';
import 'package:food_delivery_app/core/data/theme_provider.dart';
import 'package:food_delivery_app/src/screens/splashscreen/provider/splash_provider.dart';
import 'package:provider/provider.dart';

extension Providers on BuildContext {
  DataProvider get dataProvider =>
      Provider.of<DataProvider>(this, listen: false);
  ThemeProvider get themeProvider =>
      Provider.of<ThemeProvider>(this, listen: false);
  SplashScreenProvider get splashScreenProvider =>
      Provider.of<SplashScreenProvider>(this, listen: false);
}
