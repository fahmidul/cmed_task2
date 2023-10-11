import 'package:cmed_task2/config/routes/route_context.dart';
import 'package:flutter/material.dart';

import '../../presentation/character/character_screen.dart';

abstract class Routes {
  //todo:: refactor this class
  static const character = '/';
  static const characterDetails = '/character_details';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.character:
        return screen(_character());
      case Routes.characterDetails:
        final characterId = args as String;
        return screen(_characterDetails(characterId));
      default:
        return unKnowunScreen();
    }
  }

  static _character() {
    return const CharacterScreen();
  }

  static _characterDetails(String characterId) {
    // return CharacterDetailsScreen(characterId);
  }
}
