
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skin_care/core/models/product_model.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/detail/components/detail_interactive_product_image.dart';

class DetailProductImage extends StatelessWidget {
  final Product product;

  const DetailProductImage({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) =>
              DetailInteractiveProductImage(image: product.images.first),
        );
      },
      child: product.images.length > 1
          ? CarouselSlider(
              options: CarouselOptions(
                height: DeviceUtils.getDynamicHeight(context, 0.3),
                aspectRatio: 16 / 9,
                viewportFraction: 0.9,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: product.images.map((image) {
                return Image.asset(
                  image,
                  fit: BoxFit.fitWidth,
                );
              }).toList(),
            )
          : Padding(
            padding: const EdgeInsets.all(24.0),
            child: Image.network(
              product.images[0].toString(),
              width: DeviceUtils.getWidth(context),
              height: DeviceUtils.getDynamicHeight(context, 0.3),
            ),
          ),
    );
  }
}
