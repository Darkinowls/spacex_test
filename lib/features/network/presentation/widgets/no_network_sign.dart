import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_test/core/status.dart';
import 'package:spacex_test/features/network/presentation/cubit/network_cubit.dart';

class NoNetworkSign extends StatelessWidget {
  final Widget elseChild;

  const NoNetworkSign({Key? key, required this.elseChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkCubit, NetworkState>(builder: (context, state) {
      if (state.status == Status.loading) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi_off,
                color: Colors.white,
                size: 100,
              ),
              SizedBox(height: 25),
              Text(
                "No network",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        );
      }
      return elseChild;
    });
  }
}
