import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_test/core/status.dart';
import 'package:spacex_test/features/launches/domain/entities/launch_entity.dart';
import 'package:spacex_test/features/launches/domain/repositories/i_launch_repository.dart';
import 'package:spacex_test/features/rockets/presentation/cubit/rockets_cubit.dart';

part 'launches_state.dart';

class LaunchesCubit extends Cubit<LaunchesState> {
  final ILaunchRepository iLaunchRepository;
  final RocketsCubit rocketsCubit;
  late final StreamSubscription rocketSub;

  LaunchesCubit(this.iLaunchRepository, this.rocketsCubit)
      : super(const LaunchesState()) {
    rocketSub = rocketsCubit.stream.listen(_getRockets);
  }

  Future<void> _getRockets(RocketsState event) async {
    emit(state.copyWith(status: Status.loading));
    final List<LaunchEntity> launches = await iLaunchRepository
        .getLaunchesByRocketId(event.rockets[event.currentIndex].rocketId);
    emit(state.copyWith(launches: launches, status: Status.success));
  }

  @override
  Future<void> close() async {
    await rocketSub.cancel();
    return super.close();
  }
}
