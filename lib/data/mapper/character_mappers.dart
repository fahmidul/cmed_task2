import 'package:cmed_task2/core/extesnions/string_extension.dart';

import '../../domain/entites/character.dart';
import '../models/character/character_model.dart';

extension CharacterModelExtensions on CharacterModel {
  Character toDomain() {
    return Character(
      id: id ?? "",
      name: name.validate,
      house: house.validate,
      actor: actor.validate,
      image: image ?? "",
    );
  }
}
