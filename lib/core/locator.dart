import 'package:get_it/get_it.dart';
import 'package:spacex_test/core/dio_client.dart';
import 'package:spacex_test/features/launches/data/data_sources/launch_api.dart';
import 'package:spacex_test/features/launches/data/repositories/launch_repository.dart';
import 'package:spacex_test/features/launches/domain/repositories/i_launch_repository.dart';
import 'package:spacex_test/features/launches/presentation/cubit/launches_cubit.dart';
import 'package:spacex_test/features/network/presentation/cubit/network_cubit.dart';
import 'package:spacex_test/features/rockets/data/data_sources/rockets_api.dart';
import 'package:spacex_test/features/rockets/data/repositories/rocket_repository.dart';
import 'package:spacex_test/features/rockets/domain/repositories/i_rocket_repository.dart';
import 'package:spacex_test/features/rockets/presentation/cubit/rockets_cubit.dart';

final lc = GetIt.instance;

Future<void> setupLocator() async {
  lc.registerSingleton<NetworkCubit>(NetworkCubit());

  lc.registerSingleton<DioClient>(DioClient());
  lc.registerSingleton<RocketsApi>(RocketsApi(lc<DioClient>()));
  lc.registerSingleton<IRocketRepository>(RocketRepository(lc<RocketsApi>()));
  lc.registerSingleton<RocketsCubit>(
      RocketsCubit(lc<IRocketRepository>(), lc<NetworkCubit>()));

  lc.registerSingleton<LaunchApi>(LaunchApi(lc<DioClient>()));
  lc.registerSingleton<ILaunchRepository>(LaunchRepository(lc<LaunchApi>()));
  lc.registerSingleton<LaunchesCubit>(
      LaunchesCubit(lc<ILaunchRepository>(), lc<RocketsCubit>()));
}
