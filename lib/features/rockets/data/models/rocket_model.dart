class RocketModel {
  final List<String> flickrImages;
  final String rocketId;

  RocketModel({
    required this.flickrImages,
    required this.rocketId,
  });

  factory RocketModel.fromJson(Map<String, dynamic> json) => RocketModel(
        flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
        rocketId: json["rocket_id"],
      );

  Map<String, dynamic> toJson() => {
        "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
        "rocket_id": rocketId,
      };
}
