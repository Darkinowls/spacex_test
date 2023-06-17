class LaunchModel {
  final num flightNumber;
  final String missionName;
  final List<dynamic> missionId;
  final bool upcoming;
  final String launchYear;
  final num launchDateUnix;
  final DateTime launchDateUtc;
  final DateTime launchDateLocal;
  final bool isTentative;
  final String tentativeMaxPrecision;
  final bool tbd;
  final LaunchSite launchSite;
  final String wikiUrl;

  LaunchModel(
      {required this.flightNumber,
      required this.missionName,
      required this.missionId,
      required this.upcoming,
      required this.launchYear,
      required this.launchDateUnix,
      required this.launchDateUtc,
      required this.launchDateLocal,
      required this.isTentative,
      required this.tentativeMaxPrecision,
      required this.tbd,
      required this.launchSite,
      required this.wikiUrl});

  factory LaunchModel.fromJson(Map<String, dynamic> json) => LaunchModel(
      flightNumber: json["flight_number"],
      missionName: json["mission_name"],
      missionId: List<dynamic>.from(json["mission_id"].map((x) => x)),
      upcoming: json["upcoming"],
      launchYear: json["launch_year"],
      launchDateUnix: json["launch_date_unix"],
      launchDateUtc: DateTime.parse(json["launch_date_utc"]),
      launchDateLocal: DateTime.parse(json["launch_date_local"]),
      isTentative: json["is_tentative"],
      tentativeMaxPrecision: json["tentative_max_precision"],
      tbd: json["tbd"],
      launchSite: LaunchSite.fromJson(json["launch_site"]),
      wikiUrl: json["links"]["wikipedia"]);

  Map<String, dynamic> toJson() => {
        "flight_number": flightNumber,
        "mission_name": missionName,
        "mission_id": List<dynamic>.from(missionId.map((x) => x)),
        "upcoming": upcoming,
        "launch_year": launchYear,
        "launch_date_unix": launchDateUnix,
        "launch_date_utc": launchDateUtc.toIso8601String(),
        "launch_date_local": launchDateLocal.toIso8601String(),
        "is_tentative": isTentative,
        "tentative_max_precision": tentativeMaxPrecision,
        "tbd": tbd,
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
