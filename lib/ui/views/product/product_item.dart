
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/data/product_list.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/detail/detail_screen.dart';
import 'package:skin_care/ui/views/product/product_item_cart.dart';
import 'package:skin_care/ui/views/product/product_item_fav_button.dart';
import 'package:skin_care/ui/views/product/product_item_image.dart';
import 'package:skin_care/ui/views/product/product_price.dart';
import 'package:skin_care/ui/views/product/product_stock_left.dart';

class ProductItemView extends StatelessWidget {
  final int index;
  final bool showColor;

  const ProductItemView({
    required this.index,
    this.showColor = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => DetailScreen(product: productList[index])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () {
              return Container(
                width: DeviceUtils.getWidth(context),
                height: DeviceUtils.getDynamicHeight(context, 0.2),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: BaseController.themeController.isDark.value
                        ? kDarkStrokeColor
                        : kLightTextSecondaryColor.withOpacity(0.2),
                    width: 1,
                  ),
                  color: BaseController.themeController.isDark.value
                      ? kDarkFieldColor
                      : kLightFieldColor,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Stack(
                  children: [
                    ProductItemImage(index: index),
                    ProductItemFavButton(index: index),
                    ProductItemCartButton(
                      productModel: productList[index],
                    ),
                    if (productList[index].stock < 5) ProductStockLeft(index: index),
                  ],
                ),
              );
            },
          ),
          ProductPrice(productIndex: index),
          if (showColor)
            Row(
              children: productList[index]
                  .colors
                  .map(
                    (color) => Container(
                      width: 16,
                      height: 16,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}
