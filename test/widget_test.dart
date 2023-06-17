// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_test/core/dio_client.dart';
import 'package:spacex_test/features/rockets/data/data_sources/rockets_api.dart';
import 'package:spacex_test/features/rockets/data/models/rocket_model.dart';

import 'package:spacex_test/main.dart';

void main() {

  test("api", () async {
    final dio = DioClient();
    final List<RocketModel> rockets = await RocketsApi(dio).getRockets();
    print(rockets.length);
  });
}
