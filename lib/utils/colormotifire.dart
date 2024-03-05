import 'package:flutter/material.dart';

import 'color.dart';

class ColorNotifire with ChangeNotifier {

  // bool isDark = false;
  bool isDark = true;

  set setIsDark(value) {
    isDark = value;
    notifyListeners();
  }

  get getprimerycolor => isDark ? darkPrimeryColor : primeryColor;

  get getdarkscolor => isDark ? lightColor : darkColor;

  get getgreycolor => isDark ? lightgreyColor : darkgreyColor;

  get getbluecolor => isDark ? darkblueColor : lightblueColor;

  get getbox => isDark ? darkbox : lightbox;

  get greyfont => isDark ? greydark : greylight;

  get station => isDark ? stationdark : stationlight;

  get bar => isDark ? serchbaard : serchbaarl;

  get black => isDark ? b : l;

  get bg => isDark ? darkPrimeryColor : bgcolor;

  get detail => isDark ? a : d;

  void isavalable(bool value) {}
}
