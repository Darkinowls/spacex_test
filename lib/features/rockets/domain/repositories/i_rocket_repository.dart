import '../entities/rocket_entity.dart';

abstract class IRocketRepository {
  Future<List<RocketEntity>> getRockets();
}
