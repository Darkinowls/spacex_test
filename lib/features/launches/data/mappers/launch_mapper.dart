import '../../domain/entities/launch_entity.dart';
import '../models/launch_model.dart';

class LaunchMapper {
  static LaunchEntity fromModel(LaunchModel launchModel) {
    return LaunchEntity(
      dateTime: launchModel.launchDateLocal,
      missionName: launchModel.missionName,
      launchSiteName: launchModel.launchSite.siteNameLong,
      wikiUri: (launchModel.wikiUrl == null)
          ? null
          : Uri.tryParse(launchModel.wikiUrl!),
    );
  }
}
