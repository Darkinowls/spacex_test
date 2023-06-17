import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_test/core/app_theme.dart';
import 'package:spacex_test/core/locator.dart';
import 'package:spacex_test/features/launches/domain/repositories/i_launch_repository.dart';
import 'package:spacex_test/features/launches/presentation/cubit/launches_cubit.dart';

import 'features/rockets/presentation/cubit/rockets_cubit.dart';
import 'launches_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SpaceX Launches',
        theme: appTheme,
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: lc<RocketsCubit>(),
            ),
            BlocProvider.value(value: lc<LaunchesCubit>())
          ],
          child: const LaunchesScreen(),
        ));
  }
}
