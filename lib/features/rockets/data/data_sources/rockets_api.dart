import 'package:dio/dio.dart';
import 'package:spacex_test/core/dio_client.dart';

import '../models/rocket_model.dart';

class RocketsApi {
  final DioClient dioClient;

  RocketsApi(this.dioClient);

  Future<List<RocketModel>> getRockets() async {
    Response response = await dioClient.dio.get("/rockets");
    return (response.data as List)
        .map((json) => RocketModel.fromJson(json))
        .toList();
  }
}
