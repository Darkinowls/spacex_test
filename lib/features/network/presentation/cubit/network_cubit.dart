import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:spacex_test/core/status.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final Connectivity connectivity = Connectivity();
  late final StreamSubscription subscription;

  NetworkCubit() : super(const NetworkState()) {
    subscription = connectivity.onConnectivityChanged.listen(_changeStatus);
  }

  _changeStatus(ConnectivityResult result) {
    List conList = [
      ConnectivityResult.wifi,
      ConnectivityResult.mobile,
      ConnectivityResult.vpn
    ];
    if (conList.contains(result)) {
      emit(const NetworkState(status: Status.success));
      return;
    }
    emit(const NetworkState(status: Status.loading));
  }

  @override
  Future<void> close() async {
    await subscription.cancel();
    return super.close();
  }
}
