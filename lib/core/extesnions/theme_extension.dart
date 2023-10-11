
import 'package:flutter/material.dart';

import '../utils/colors.dart';

extension ThemeContextExtension on BuildContext {
  Color get primaryColor {
    return Theme.of(this).primaryColor;
  }

  Color get primaryColorLight {
    return Theme.of(this).primaryColorLight;
  }

  Color get scaffoldBackgroundColor {
    return Theme.of(this).scaffoldBackgroundColor;
  }

  bool get isDark {
    return Theme.of(this).scaffoldBackgroundColor == AppColor.blackBg;
  }

}
