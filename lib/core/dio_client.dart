import 'package:dio/dio.dart';

class DioClient{
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://api.spacexdata.com/v3"
    )
  );
}