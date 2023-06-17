import 'package:flutter/material.dart';
import 'package:spacex_test/features/launches/presentation/widgets/launch_list.dart';
import 'package:spacex_test/features/rockets/presentation/widgets/rocket_carousel.dart';

class LaunchesScreen extends StatelessWidget {
  const LaunchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(25),
              child: Text("SpaceX Launches", style: TextStyle(fontSize: 24)),
            ),
            const RocketCarousel(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Missions",
                      style: TextStyle(fontSize: 24),
                    ),
                    Expanded(child: LaunchList())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
