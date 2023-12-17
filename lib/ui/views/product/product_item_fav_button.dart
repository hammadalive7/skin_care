import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/data/product_list.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';

class ProductItemFavButton extends StatefulWidget {
  final int index;

  const ProductItemFavButton({required this.index, super.key});

  @override
  State<ProductItemFavButton> createState() => _ProductItemFavButtonState();
}

class _ProductItemFavButtonState extends State<ProductItemFavButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      child: Container(
        decoration: BoxDecoration(
          color: BaseController.themeController.isDark.value
              ? kLightTextPrimaryColor
              : kWhiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkResponse(
          onTap: () {
            HapticFeedback.selectionClick();
            productList[widget.index].isFavorite =
                (!productList[widget.index].isFavorite);
          },
          radius: 10,
          containedInkWell: true,
          child: Obx(() {
            return Center(
              child: SizedBox(
                height: 25,
                width: 25,
                child: Icon(
                  productList[widget.index].isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  size: 20,
                  color: BaseController.themeController.isDark.value
                      ? kWhiteColor
                      : kLightTextPrimaryColor,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
