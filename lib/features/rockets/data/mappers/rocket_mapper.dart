import 'package:spacex_test/features/rockets/data/models/rocket_model.dart';
import 'package:spacex_test/features/rockets/domain/entities/rocket_entity.dart';

class RocketMapper {
  static RocketEntity fromModel(RocketModel rocketModel) {
    return RocketEntity(
        rocketId: rocketModel.rocketId,
        imageRef: rocketModel.flickrImages.first);
  }
}
