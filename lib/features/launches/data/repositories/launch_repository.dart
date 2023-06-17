import 'package:spacex_test/features/launches/data/data_sources/launch_api.dart';
import 'package:spacex_test/features/launches/data/mappers/launch_mapper.dart';
import 'package:spacex_test/features/launches/data/models/launch_model.dart';
import 'package:spacex_test/features/launches/domain/entities/launch_entity.dart';
import 'package:spacex_test/features/launches/domain/repositories/i_launch_repository.dart';

class LaunchRepository implements ILaunchRepository {
  final LaunchApi launchApi;

  LaunchRepository(this.launchApi);

  @override
  Future<List<LaunchEntity>> getLaunchesByRocketId(String rocketId) async {
    final List<LaunchModel> launchModels =
        await launchApi.getLaunchByRocketId(rocketId);
    return launchModels.map((model) => LaunchMapper.fromModel(model)).toList();
  }
}
