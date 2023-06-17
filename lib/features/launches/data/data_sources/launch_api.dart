import 'package:dio/dio.dart';
import 'package:spacex_test/core/dio_client.dart';
import 'package:spacex_test/features/launches/data/models/launch_model.dart';

class LaunchApi {
  final DioClient dioClient;

  LaunchApi(this.dioClient);

  Future<List<LaunchModel>> getLaunchByRocketId(String rocketId) async {
    Response response = await dioClient.dio
        .get("/launches", queryParameters: {"rocket_id": rocketId});
    return (response.data as List)
        .map((json) => LaunchModel.fromJson(json))
        .toList();
  }
}
