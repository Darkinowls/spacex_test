import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_test/core/datetime_extention.dart';
import 'package:spacex_test/core/status.dart';
import 'package:spacex_test/core/ui/loader.dart';
import 'package:spacex_test/features/launches/presentation/cubit/launches_cubit.dart';

import 'launch_tile.dart';

class LaunchList extends StatelessWidget {
  const LaunchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchesCubit, LaunchesState>(builder: (context, state) {
      if (state.status == Status.loading) {
        return const Loader();
      }
      return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemCount: state.launches.length,
        itemBuilder: (context, index) => LaunchTile(
          launch: state.launches[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      );
    });
  }
}
