import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/data/data_provider.dart';

class ThemeProvider extends ChangeNotifier {
  final DataProvider _dataProvider;

  ThemeProvider(this._dataProvider);

  ThemeMode get themeMode =>
      _dataProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _dataProvider.isDarkMode = !_dataProvider.isDarkMode;
    notifyListeners();
  }

  void updateThemeMode(Brightness platformBrightness) {
    bool isDarkMode = platformBrightness == Brightness.dark;
    if (_dataProvider.isDarkMode != isDarkMode) {
      _dataProvider.isDarkMode = isDarkMode;
      notifyListeners();
    }
  }
}
