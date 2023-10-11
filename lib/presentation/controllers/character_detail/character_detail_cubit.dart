import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entites/character_details.dart';
import '../../../domain/usecases/character/get_character_details_by_id.dart';
import 'character_detail_state.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  CharacterDetailsCubit(this._usecase) : super(CharacterDetailsInitial());
  final GetCharacterDetailsById _usecase;

  CharacterDetails? characterDetailsEntity;

  getCharacterDetailsById(String charater) async {
    emit(CharacterDetailsLoading());
    (await _usecase.call(charater)).fold(
      (failure) {
        emit(CharacterDetailsFailure(failure.message));
      },
      (characterDetail) {
        characterDetailsEntity = characterDetail;
        emit(CharacterDetailsLoaded());
      },
    );
  }
}
