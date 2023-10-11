import 'package:cmed_task2/core/extesnions/string_extension.dart';

import '../../domain/entites/character_details.dart';
import '../models/character/character_details_model.dart';

extension CharacterDetailModelExtension on CharacterDetailsModel {
  CharacterDetails toDomain() {
    return CharacterDetails(
      id: id ?? "",
      name: name.validate,
      gender: gender.validate,
      house: house.validate,
      dateOfBirth: dateOfBirth.validate,
      eyeColour: eyeColour.validate,
      hairColour: hairColour.validate,
      actor: actor.validate,
      alive: alive ?? false,
      image: image ?? "",
    );
  }
}
