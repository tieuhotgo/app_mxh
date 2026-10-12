import 'package:flutter/material.dart';

class AppNavigationService {
  static final ValueNotifier<int> tabIndex = ValueNotifier<int>(0);

  static void goToTab(BuildContext context, int index) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    tabIndex.value = index;
  }
}
