import 'package:dio/dio.dart';

import '../../core/utils/constants.dart';
import '../models/character/character_details_model.dart';
import '../models/character/character_model.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getCharacters();

  Future<CharacterDetailsModel> getCharacterDetails({required String characterId});
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final Dio _dio;

  CharacterRemoteDataSourceImpl(this._dio);

  @override
  Future<List<CharacterModel>> getCharacters() async {
    try {
      //todo refactor below lines
      Response response = await _dio.get(AppConstants.baseUrl + AppConstants.getCharacters);
      final data = response.data as List<dynamic>;
      return data.map((json) => CharacterModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<CharacterDetailsModel> getCharacterDetails({required String characterId}) async {

      //todo refactor below lines
      Response response = await _dio.get("${AppConstants.baseUrl}${AppConstants.getCharacterDetails}/$characterId");
      List<dynamic> dynamicListData = response.data;
      if (dynamicListData.isNotEmpty) {
        CharacterDetailsModel characterDetails = CharacterDetailsModel.fromJson(dynamicListData.first);
        return characterDetails;
      } else {

        throw Exception('No character details found');
      }

  }
}
