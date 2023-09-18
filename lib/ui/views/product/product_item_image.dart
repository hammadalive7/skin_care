import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/data/product_list.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';

class ProductItemImage extends StatefulWidget {
  final int index;

  const ProductItemImage({required this.index, super.key});

  @override
  State<ProductItemImage> createState() => _ProductItemImageState();
}

class _ProductItemImageState extends State<ProductItemImage> {
  @override
  Widget build(BuildContext context) {
    return productList[widget.index].images.length > 1
        ? Column(
            children: [
              Flexible(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 600.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                  ),
                  items: productList[widget.index].images.map((image) {
                    return Image.asset(
                      image,
                      fit: BoxFit.fitWidth,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 14.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: productList[widget.index].images.map((entry) {
                    return Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 1.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BaseController.themeController.isDark.value
                              ? kLightFieldColor
                              : kDarkFieldColor),
                    );
                  }).toList(),
                ),
              )
            ],
          )
        : Hero(
            tag: productList[widget.index].id,
            child: Center(
              child: Image.asset(
                productList[widget.index].images.first,
                height: DeviceUtils.getDynamicHeight(context, 0.12),
                width: DeviceUtils.getDynamicWidth(context, 0.28),
                fit: BoxFit.contain,
              ),
            ),
          );
  }
}
