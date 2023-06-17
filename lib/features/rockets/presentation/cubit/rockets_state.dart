part of 'rockets_cubit.dart';

class RocketsState extends Equatable {
  final List<RocketEntity> rockets;
  final int currentIndex;
  final Status status;

  const RocketsState({
    this.currentIndex = 0,
    this.rockets = const [],
    this.status = Status.loading,
  });

  @override
  List<Object> get props => [rockets, currentIndex, status];

  RocketsState copyWith({
    List<RocketEntity>? rockets,
    int? currentIndex,
    Status? status,
  }) {
    return RocketsState(
      rockets: rockets ?? this.rockets,
      currentIndex: currentIndex ?? this.currentIndex,
      status: status ?? this.status,
    );
  }
}
