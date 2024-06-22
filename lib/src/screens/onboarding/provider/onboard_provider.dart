import 'package:flutter/material.dart';

class OnboardProvider extends ChangeNotifier {
  int _currentPage = 0;
  int _pageCount = 0;

  int get currentPage => _currentPage;
  int get pageCount => _pageCount;
  bool get isLastPage => _currentPage == _pageCount - 1;

  void setPageCount(int count) {
    _pageCount = count;
    notifyListeners();
  }

  void nextPage() {
    if (_currentPage < _pageCount - 1) {
      _currentPage++;
      notifyListeners();
    }
  }

  void setPage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}
