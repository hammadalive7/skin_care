import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skin_care/core/utils/device_utils.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.05),
        vertical: DeviceUtils.getDynamicWidth(context, 0.04),
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 18 / 10,
          viewportFraction: 1,
          initialPage: 0,
          enlargeCenterPage: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
        items: [
          "assets/images/banner1.png",
          "assets/images/banner2.png",
          "assets/images/banner3.png",
        ].map((e) => ClipRRect(

                  borderRadius: BorderRadius.circular(24.0),
                  child: Image.asset(
                    e,
                    width: DeviceUtils.getWidth(context),
                    height: DeviceUtils.getDynamicHeight(context, 0.2),
                    fit: BoxFit.fitWidth,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
