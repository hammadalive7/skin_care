
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:skin_care/core/models/product_model.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/ui/views/detail/components/detail_add_to_cart_button.dart';
import 'package:skin_care/ui/views/detail/components/detail_app_bar.dart';
import 'package:skin_care/ui/views/detail/components/detail_body.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({required this.product, Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    // BaseController.detailController.changeColor(widget.product.colors.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DetailAppBar(),
      body: DetailBody(product: widget.product),
      floatingActionButton: SlideInRight(
        from: 10,
        duration: const Duration(milliseconds: 800),
        child: DetailAddToCartButton(
          productId: widget.product.id!,
          retailPrice: widget.product.discountRate != null
              ? BaseController.homeController
                  .calculateDiscount(
                      widget.product.retailPrice, widget.product.discountRate!)
                  .toStringAsFixed(2)
              : widget.product.retailPrice.toString(),
        ),
      ),
    );
  }
}
