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
      child: InkResponse(
        onTap: () {
          HapticFeedback.selectionClick();
          productList[widget.index].isFavorite.value =
              (!productList[widget.index].isFavorite.value);
        },
        radius: 10,
        containedInkWell: true,
        child: Obx(() {
          return Center(
            child: SizedBox(
              height: 25,
              width: 25,
              child: Icon(
                productList[widget.index].isFavorite.value
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
    );
  }
}
