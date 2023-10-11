import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/strings.dart';
import '../../presentation/widgets/common/text_utils.dart';


screen(Widget child, [PageTransitionType? type]) {
  return PageTransition(
    child: child,
    type: type ?? PageTransitionType.rightToLeftWithFade,
    curve: Curves.linear,
    duration: const Duration(milliseconds: AppConstants.pageTransitionInMilli),
    alignment: Alignment.center,
  );
}

unKnownScreen() {
  return MaterialPageRoute(
    builder: (context) =>  const Scaffold(
      body: Center(
        child: TextUtils(
          text: AppStrings.unknownError,
          fontSize: 30,

        ),
      ),
    ),
  );
}

extension RouteContextExtension on BuildContext {
  // Navigation functions
  goTo(Widget child, [bool replacement = false]) {
    if (replacement) {
      Navigator.of(this).pushReplacement(screen(child));
    } else {
      Navigator.of(this).push(screen(child));
    }
  }

  goToNamed({required String route, bool replacement = false, Object? args}) {
    if (replacement) {
      Navigator.of(this).pushReplacementNamed(route, arguments: args);
    } else {
      Navigator.of(this).pushNamed(route, arguments: args);
    }
  }

  back() {
    Navigator.of(this).pop();
  }

  pushRemoveUntil(String route) {
    Navigator.of(this).pushNamedAndRemoveUntil(route, (route) => false);
  }
}
