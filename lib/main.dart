import 'package:flutter/material.dart';
import 'app.dart';
import 'config/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/common/controllers/bloc_observer/my_bloc_observer.dart';
import 'presentation/common/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await startInitialize();

  Bloc.observer = MyBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ThemeCubit>()),
      ],
      child: const CharacterApp(),
    ),
  );
}

Future<void> startInitialize() async {
  await serviceLocatorStart();
}
