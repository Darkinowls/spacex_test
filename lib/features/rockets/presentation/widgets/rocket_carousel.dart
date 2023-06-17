import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spacex_test/core/status.dart';
import 'package:spacex_test/core/ui/loader.dart';
import 'package:spacex_test/features/rockets/presentation/cubit/rockets_cubit.dart';

class RocketCarousel extends StatelessWidget {
  const RocketCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275,
      child: BlocBuilder<RocketsCubit, RocketsState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Loader();
          }
          return Column(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                    onPageChanged: (index, _) =>
                        BlocProvider.of<RocketsCubit>(context).setIndex(index),
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height),
                itemCount: state.rockets.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              state.rockets[itemIndex].imageRef),
                          fit: BoxFit.cover)),
                ),
              ),
              AnimatedSmoothIndicator(
                  duration: const Duration(milliseconds: 0),
                  effect: CustomizableEffect(
                    dotDecoration: DotDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                        dotBorder: const DotBorder(color: Colors.white)),
                    activeDotDecoration: DotDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        dotBorder: const DotBorder(color: Colors.white)),
                  ),
                  activeIndex: state.currentIndex,
                  count: state.rockets.length)
            ],
          );
        },
      ),
    );
  }
}
