import 'package:cmed_task2/data/mapper/character_details_mappers.dart';
import 'package:dartz/dartz.dart';
import '../../core/errors/failure.dart';
import '../../core/errors/server_failure.dart';
import '../../core/network_info/network_info.dart';
import '../../core/utils/strings.dart';
import '../../domain/entites/character_details.dart';
import '../../domain/repository/repositories.dart';
import '../data_source/character_remote_data_source.dart';
import 'package:dio/dio.dart';

class CharacterDetailRepositoryImpl implements CharacterDetailsRepository {
  final CharacterRemoteDataSource _remote;
  final NetworkInfo _networkInfo;

  CharacterDetailRepositoryImpl(this._remote, this._networkInfo);

  @override
  Future<Either<Failure, CharacterDetails>> getCharacterDetail({required String characterId}) async {
    try {
      if (!await _networkInfo.isConnected) {
        return const Left(ServerFailure(AppStrings.internetConnectionError));
      }
      final response = await _remote.getCharacterDetails(characterId: characterId);
      return Right(response.toDomain());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }

      return Left(ServerFailure(e.toString()));
    }
  }
}
