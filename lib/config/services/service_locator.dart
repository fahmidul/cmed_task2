import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../core/network_info/network_info.dart';
import '../../data/data_source/character_remote_data_source.dart';
import '../../data/network/dio_factory.dart';
import '../../data/repository/character_details_repository_impl.dart';
import '../../data/repository/character_repository_impl.dart';
import '../../domain/repository/repositories.dart';
import '../../domain/usecases/character/get_characters.dart';
import '../../presentation/common/theme/theme_cubit.dart';
import '../../presentation/controllers/character/character_cubit.dart';

final getIt = GetIt.instance;

serviceLocatorStart() async {
  await setupAppService();
  setupAPIService();
  setupRemoteDataSource();
  setupRepositories();
  setupCharacterCubit();
}

setupAppService() async {
  setupThemeService();
}

void setupThemeService() {
  if (!GetIt.I.isRegistered<ThemeCubit>()) {
    getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit(ThemeMode.light));
  }
}

setupAPIService() {
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
  getIt.registerLazySingleton<DioFactory>(() => DioFactoryImpl());
  final productServiceDio = getIt<DioFactory>().getDio();
  getIt.registerLazySingleton(() => productServiceDio);
}

setupRepositories() {
  getIt.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(getIt(), getIt()));
  getIt.registerLazySingleton<CharacterDetailsRepository>(() => CharacterDetailRepositoryImpl(getIt(), getIt()));
}

setupRemoteDataSource() {
  getIt.registerLazySingleton<CharacterRemoteDataSource>(() => CharacterRemoteDataSourceImpl(getIt()));
}

setupCharacterCubit() {
  if (!GetIt.I.isRegistered<CharacterCubit>()) {
    getIt.registerLazySingleton<GetCharacters>(() => GetCharacters(getIt()));
    getIt.registerFactory<CharacterCubit>(() => CharacterCubit(getIt()));
  }
}
