import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_test/core/status.dart';
import 'package:spacex_test/features/network/presentation/cubit/network_cubit.dart';
import 'package:spacex_test/features/rockets/domain/entities/rocket_entity.dart';
import 'package:spacex_test/features/rockets/domain/repositories/i_rocket_repository.dart';

part 'rockets_state.dart';

class RocketsCubit extends Cubit<RocketsState> {
  final IRocketRepository iRocketRepository;
  final NetworkCubit networkCubit;
  late final StreamSubscription subscription;

  RocketsCubit(this.iRocketRepository, this.networkCubit) : super(const RocketsState()) {
    subscription = networkCubit.stream.listen((event) {
      if (event.status == Status.success) {
        _loadRockets();
      }
    });
    _loadRockets();
  }

  Future<void> _loadRockets() async {
    emit(state.copyWith(status: Status.loading));
    final List<RocketEntity> rockets = await iRocketRepository.getRockets();
    emit(state.copyWith(rockets: rockets, status: Status.success));
  }

  void setIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  @override
  Future<void> close() async {
    await subscription.cancel();
    return super.close();
  }

}
