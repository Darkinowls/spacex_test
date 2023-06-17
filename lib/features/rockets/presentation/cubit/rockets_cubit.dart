import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_test/core/status.dart';
import 'package:spacex_test/features/rockets/domain/entities/rocket_entity.dart';
import 'package:spacex_test/features/rockets/domain/repositories/i_rocket_repository.dart';

part 'rockets_state.dart';

class RocketsCubit extends Cubit<RocketsState> {
  final IRocketRepository iRocketRepository;

  RocketsCubit(this.iRocketRepository) : super(const RocketsState()) {
    getRockets();
  }

  Future<void> getRockets() async {
    emit(state.copyWith(status: Status.loading));
    final List<RocketEntity> rockets = await iRocketRepository.getRockets();
    emit(state.copyWith(rockets: rockets, status: Status.success));
  }

  void setIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
