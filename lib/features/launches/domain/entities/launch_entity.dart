import 'package:equatable/equatable.dart';

class LaunchEntity extends Equatable {
  final DateTime dateTime;
  final String missionName;
  final String launchSiteName;
  final Uri wikiUri;

  const LaunchEntity({
    required this.dateTime,
    required this.missionName,
    required this.launchSiteName,
    required this.wikiUri
  });

  @override
  List<Object> get props => [dateTime, missionName, launchSiteName, wikiUri];

}
