import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/models/product_model.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';

class ProductItemCartButton extends StatefulWidget {
  final Product productModel;

  const ProductItemCartButton({required this.productModel, super.key});

  @override
  State<ProductItemCartButton> createState() => _ProductItemCartButtonState();
}

class _ProductItemCartButtonState extends State<ProductItemCartButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: InkResponse(
        onTap: () async {
          final result =
              BaseController.cartController.addItemToCart(widget.productModel.id!);
          if (result) {
            HapticFeedback.lightImpact();
            widget.productModel.isAddedToCartDone = true;
          }
          await Future.delayed(const Duration(milliseconds: 500), () {
            widget.productModel.isAddedToCartDone = false;
          });
        },
        radius: 10,
        containedInkWell: true,
        child: SizedBox(
          height: 25,
          width: 25,
          child: Obx(() {
            return Center(
              child: SvgPicture.asset(
                widget.productModel.isAddedToCartDone
                    ? "assets/images/check.svg"
                    : "assets/images/cart.svg",
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  BaseController.themeController.isDark.value
                      ? kWhiteColor
                      : kLightTextPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
