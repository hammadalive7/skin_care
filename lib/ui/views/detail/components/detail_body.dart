
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:skin_care/core/models/product_model.dart';
import 'package:skin_care/ui/views/detail/components/detail_info.dart';
import 'package:skin_care/ui/views/detail/components/detail_properties.dart';
import 'package:skin_care/ui/views/detail/components/detail_product_image.dart';

class DetailBody extends StatelessWidget {
  final Product product;

  const DetailBody({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailProductImage(product: product),
          FadeInUp(
              from: 5,
              duration: const Duration(milliseconds: 400),
              child: DetailInfo(model: product.model, colors: product.colors)),
          FadeInUp(
              from: 10,
              duration: const Duration(milliseconds: 600),
              child: DetailProperties(product: product)),
        ],
      ),
    );
  }
}
