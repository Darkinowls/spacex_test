class LaunchModel {
  final String missionName;
  final DateTime launchDateLocal;
  final LaunchSite launchSite;
  final String? wikiUrl;

  LaunchModel(
      {
      required this.missionName,
      required this.launchDateLocal,
      required this.launchSite, this.wikiUrl});

  factory LaunchModel.fromJson(Map<String, dynamic> json) => LaunchModel(
      missionName: json["mission_name"],
      launchDateLocal: DateTime.parse(json["launch_date_local"]),
      launchSite: LaunchSite.fromJson(json["launch_site"]),
      wikiUrl: json["links"]["wikipedia"]);

  Map<String, dynamic> toJson() => {
        "mission_name": missionName,
        "launch_date_local": launchDateLocal.toIso8601String(),
        "launch_site": launchSite.toJson(),
      };
}

class LaunchSite {
  final String siteId;
  final String siteName;
  final String siteNameLong;

  LaunchSite({
    required this.siteId,
    required this.siteName,
    required this.siteNameLong,
  });

  factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
        siteId: json["site_id"],
        siteName: json["site_name"],
        siteNameLong: json["site_name_long"],
      );

  Map<String, dynamic> toJson() => {
        "site_id": siteId,
        "site_name": siteName,
        "site_name_long": siteNameLong,
      };
}
