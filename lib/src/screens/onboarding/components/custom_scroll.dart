import 'package:flutter/material.dart';

class LockScrollPhysics extends ScrollPhysics {
  final bool lock;

  const LockScrollPhysics({super.parent, required this.lock});

  @override
  LockScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return LockScrollPhysics(parent: buildParent(ancestor), lock: lock);
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    if (lock && offset < 0) {
      return 0;
    }
    return super.applyPhysicsToUserOffset(position, offset);
  }
}
