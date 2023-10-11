import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../entites/character_details.dart';
import '../../repository/repositories.dart';
import '../base_usecase.dart';

class GetCharacterDetailsById implements BaseUsecase<CharacterDetails, String> {
  final CharacterDetailsRepository _repository;
  GetCharacterDetailsById(this._repository);
  @override
  Future<Either<Failure, CharacterDetails>> call(String characterId) async {
    return await _repository.getCharacterDetail(characterId: characterId);
  }
}
