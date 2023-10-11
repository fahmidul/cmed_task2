import 'package:cmed_task2/data/mapper/character_mappers.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../core/errors/failure.dart';
import '../../core/errors/server_failure.dart';
import '../../core/network_info/network_info.dart';
import '../../core/utils/strings.dart';
import '../../domain/entites/character.dart';
import '../../domain/repository/repositories.dart';
import '../data_source/character_remote_data_source.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource _remote;
  final NetworkInfo _networkInfo;

  CharacterRepositoryImpl(this._remote, this._networkInfo);

  @override
  Future<Either<Failure, List<Character>>> getCharacters() async {
    try {
      if (!await _networkInfo.isConnected) {
        return const Left(ServerFailure(AppStrings.internetConnectionError));
      }
      final response = await _remote.getCharacters();
      if (response.isNotEmpty) {
        return Right(response.map((e) => e.toDomain()).toList());
      }
      return const Right([]);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }

      return Left(ServerFailure(e.toString()));
    }
  }
}
