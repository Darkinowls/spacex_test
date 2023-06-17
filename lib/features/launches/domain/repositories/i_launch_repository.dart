import 'package:spacex_test/features/launches/domain/entities/launch_entity.dart';


abstract class ILaunchRepository {
  Future<List<LaunchEntity>> getLaunchesByRocketId(String rocketId);
}
