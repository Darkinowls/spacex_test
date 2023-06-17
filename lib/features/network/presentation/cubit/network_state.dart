part of 'network_cubit.dart';

class NetworkState extends Equatable {
  final Status status;

  const NetworkState({this.status = Status.loading});

  @override
  List<Object?> get props => [status];
}
