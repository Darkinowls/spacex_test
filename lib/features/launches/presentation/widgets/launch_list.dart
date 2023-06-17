import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_test/core/datetime_extention.dart';
import 'package:spacex_test/core/status.dart';
import 'package:spacex_test/core/ui/loader.dart';
import 'package:spacex_test/features/launches/presentation/cubit/launches_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchList extends StatelessWidget {
  const LaunchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchesCubit, LaunchesState>(builder: (context, state) {
      if (state.status == Status.loading) {
        return const Loader();
      }
      return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemCount: state.launches.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => launchUrl(state.launches[index].wikiUri),
          child: Ink(
            // margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(28, 28, 28, 1),
                borderRadius: BorderRadius.circular(10)),
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.launches[index].dateTime.getDate(),
                            style: const TextStyle(
                                color: Color.fromRGBO(186, 252, 84, 1),
                                fontSize: 16)),
                        Text(
                          state.launches[index].dateTime.getTime(),
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.launches[index].missionName,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(state.launches[index].launchSiteName,
                              style: const TextStyle(color: Colors.grey)),
                        ],
                      ))
                ],
                // Text(state.launches[index].missionName
              ),
            ),
          ),
        ),
      );
    });
  }
}
