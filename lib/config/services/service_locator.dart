import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

serviceLocatorStart() async {
  await setupAppService();
  setupAPIService();
  setupRemoteDataSource();
  setupRepositories();
  setupCharacterCubit();
  setupCharacterDetailsCubit();
}

setupAppService() async {
  setupThemeService();
}

void setupThemeService() {

}

setupAPIService() {}

setupRepositories() {}

setupRemoteDataSource() {}

setupCharacterCubit() {}

setupCharacterDetailsCubit() {}
