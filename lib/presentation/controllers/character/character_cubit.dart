import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entites/character.dart';
import '../../../domain/usecases/base_usecase.dart';
import '../../../domain/usecases/character/get_characters.dart';
import 'character_detail_state.dart';

// todo:: remove all product ***

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this._usecase) : super(CharacterInitial());
  final GetCharacters _usecase;

  List<Character> characters = [];

  getCharacters() async {

    emit(CharacterLoading());
    (await _usecase.call(const NoParameters())).fold(
      (failure) {
        emit(CharacterFailure(failure.message));
      },
      (charactersData) {
        characters = charactersData;
        emit(CharacterLoaded());
      },
    );
  }
}
