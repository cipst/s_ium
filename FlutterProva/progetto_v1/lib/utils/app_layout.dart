import 'package:flutter/material.dart';

class AppLayout {
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double initNavigationBarHeight = 80.0;
}
