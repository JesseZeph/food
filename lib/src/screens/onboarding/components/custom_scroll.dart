import 'package:flutter/material.dart';

class CustomScrollPhysics extends ScrollPhysics {
  final bool allowScrolling;

  const CustomScrollPhysics({super.parent, required this.allowScrolling});

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(
        parent: buildParent(ancestor), allowScrolling: allowScrolling);
  }

  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) {
    return allowScrolling;
  }
}
