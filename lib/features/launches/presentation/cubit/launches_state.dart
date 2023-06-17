part of 'launches_cubit.dart';

class LaunchesState extends Equatable {
  final List<LaunchEntity> launches;
  final Status status;

  const LaunchesState({
    this.launches = const [],
    this.status = Status.loading,
  });

  @override
  List<Object> get props => [launches, status];

  LaunchesState copyWith({
    List<LaunchEntity>? launches,
    Status? status,
  }) {
    return LaunchesState(
      launches: launches ?? this.launches,
      status: status ?? this.status,
    );
  }
}
