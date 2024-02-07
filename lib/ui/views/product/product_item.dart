import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/data/product_list.dart';
import 'package:skin_care/core/models/product_model.dart';
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
  Product product;

  ProductItemView({
    required this.index,
    required this.product,
    this.showColor = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => DetailScreen(product: product)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () {
              return Container(
                width: DeviceUtils.getDynamicWidth(context, 0.4),
                height: DeviceUtils.getDynamicHeight(context, 0.27),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
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
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ProductItemImage(
                            index: index, productImage: product.images),
                        ProductItemFavButton(index: index),
                        ProductItemCartButton(
                          productModel: product,
                        ),
                        if (productList[index].stock! < 5)
                          ProductStockLeft(index: index),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    ProductPrice(
                        productIndex: index,
                        productPrice: product.retailPrice,
                        productName: product.name),
                  ],
                ),
              );
            },
          ),
          // if (showColor)
          // Row(
          //   children: productList[index]
          //       .colors
          //       .map(
          //         (color) => Container(
          //           width: 16,
          //           height: 16,
          //           margin: const EdgeInsets.symmetric(horizontal: 4.0),
          //           decoration: BoxDecoration(
          //             color: color,
          //             shape: BoxShape.circle,
          //           ),
          //         ),
          //       )
          //       .toList(),
          // ),
        ],
      ),
    );
  }
}
