import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/routes/routes.dart';
import 'core/utils/strings.dart';
import 'core/utils/style.dart';
import 'presentation/common/theme/theme_cubit.dart';

class CharacterApp extends StatefulWidget {
  const CharacterApp({super.key});

  @override
  State<CharacterApp> createState() => _CmedAppState();
}

class _CmedAppState extends State<CharacterApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      buildWhen: (previous, current) => previous != current,
      builder: (_, state) {
        return MaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state,
          initialRoute: Routes.character,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      },
    );
  }
}
