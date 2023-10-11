import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../entites/character.dart';
import '../../repository/repositories.dart';
import '../base_usecase.dart';

class GetCharacters implements BaseUsecase<List<Character>, NoParameters> {
  final CharacterRepository _repository;

  GetCharacters(this._repository);

  @override
  Future<Either<Failure, List<Character>>> call(NoParameters parameters) async {
    return await _repository.getCharacters();
  }
}
