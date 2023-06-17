import 'package:spacex_test/features/rockets/domain/entities/rocket_entity.dart';
import 'package:spacex_test/features/rockets/data/data_sources/rockets_api.dart';
import 'package:spacex_test/features/rockets/data/models/rocket_model.dart';
import 'package:spacex_test/features/rockets/domain/repositories/i_rocket_repository.dart';

import '../mappers/rocket_mapper.dart';

class RocketRepository implements IRocketRepository {
  final RocketsApi rocketsApi;

  RocketRepository(this.rocketsApi);

  @override
  Future<List<RocketEntity>> getRockets() async {
    final List<RocketModel> rocketModels = await rocketsApi.getRockets();
    return rocketModels.map((model) => RocketMapper.fromModel(model)).toList();
  }
}
