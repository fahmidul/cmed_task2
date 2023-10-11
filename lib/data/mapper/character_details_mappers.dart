import '../../domain/entites/character_details.dart';
import '../models/character/character_details_model.dart';

extension CharacterDetailModelExtension on CharacterDetailsModel {
  CharacterDetails toDomain() {
    return CharacterDetails(
      id: id ?? "",
      name: name ?? "",
      gender: gender ?? "",
      house: house ?? "",
      dateOfBirth: dateOfBirth ?? "",
      eyeColour: eyeColour ?? "",
      hairColour: hairColour ?? "",
      actor: actor ?? "",
      alive: alive ?? false,
      image: image ?? "",
    );
  }
}
