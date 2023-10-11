import '../../domain/entites/character.dart';
import '../models/character/character_model.dart';

extension CharacterModelExtensions on CharacterModel {
  Character toDomain() {
    return Character(
      id: id ?? "",
      name: name ?? "N/A",
      house: house ?? "N/A",
      actor: actor ?? "N/A",
      image: image ?? "",
    );
  }
}
