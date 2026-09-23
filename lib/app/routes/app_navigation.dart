import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension AppNavigation on BuildContext {
  void goBackOr(String fallbackLocation) {
    if (canPop()) {
      pop();
      return;
    }

    go(fallbackLocation);
  }
}
