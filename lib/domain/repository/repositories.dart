import 'package:dartz/dartz.dart';
import '../../core/errors/failure.dart';
import '../entites/character.dart';
import '../entites/character_details.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<Character>>> getCharacters();
}

abstract class CharacterDetailsRepository {
  Future<Either<Failure, CharacterDetails>> getCharacterDetail({required String characterId});
}
