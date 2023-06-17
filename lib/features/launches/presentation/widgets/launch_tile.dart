import 'package:flutter/material.dart';
import 'package:spacex_test/core/datetime_extention.dart';
import 'package:spacex_test/features/launches/domain/entities/launch_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchTile extends StatelessWidget {
  final LaunchEntity launch;

  const LaunchTile({Key? key, required this.launch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        child: InkWell(
          onTap: (launch.wikiUri == null)
              ? null
              : () {
                  launchUrl(launch.wikiUri!).then((success) {
                    if (!success) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text("The wiki page is not found"),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Ok"))
                                ],
                              ));
                    }
                  });
                },
          child: Ink(
            padding: const EdgeInsets.all(15),
            decoration:
                const BoxDecoration(color: Color.fromRGBO(28, 28, 28, 1)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(launch.dateTime.getDate(),
                          style: const TextStyle(
                              color: Color.fromRGBO(186, 252, 84, 1),
                              fontSize: 16)),
                      Text(
                        launch.dateTime.getTime(),
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        launch.missionName,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        launch.launchSiteName,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
