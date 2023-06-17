import 'package:flutter/material.dart';
import 'package:spacex_test/core/datetime_extention.dart';
import 'package:spacex_test/features/launches/domain/entities/launch_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchTile extends StatelessWidget {
  final List<LaunchEntity> launches;
  final int index;

  const LaunchTile({Key? key, required this.launches, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(25)),
      contentPadding: const EdgeInsets.all(10),
      tileColor: const Color.fromRGBO(28, 28, 28, 1),
      onTap: (launches[index].wikiUri == null)
          ? null
          : () {
              launchUrl(launches[index].wikiUri!).then((success) {
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
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(launches[index].dateTime.getDate(),
              style: const TextStyle(
                  color: Color.fromRGBO(186, 252, 84, 1), fontSize: 16)),
          Text(
            launches[index].dateTime.getTime(),
            style: const TextStyle(color: Colors.grey),
          )
        ],
      ),
      title: Text(
        launches[index].missionName,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        launches[index].launchSiteName,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
