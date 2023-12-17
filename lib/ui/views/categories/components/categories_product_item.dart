

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/data/product_list.dart';
import 'package:skin_care/core/models/product_model.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_material_button.dart';
import 'package:skin_care/ui/views/detail/detail_screen.dart';
import 'package:skin_care/ui/views/product/product_price.dart';

class CategoriesProductItem extends StatelessWidget {
  final int index;
  final Product product;

  const CategoriesProductItem({
    required this.index,
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => DetailScreen(product: product)),
      child: Container(
        width: DeviceUtils.getWidth(context),
        height: DeviceUtils.getDynamicHeight(context, 0.2),
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: BaseController.themeController.isDark.value
              ? kDarkFieldColor
              : kLightFieldColor,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductPrice(productIndex: index, productPrice: product.retailPrice, productName: product.name),
                  const SizedBox(height: 4.0),
                  CustomMaterialButton(
                    backgroundColor: kLightBlueColor,
                    borderRadius: BorderRadius.circular(48.0),
                    onTap: () =>
                        Get.to(() => DetailScreen(product: product)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        TranslationKeys.view.tr,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: kWhiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.network(
                  product.images.first,
                height: DeviceUtils.getDynamicHeight(context, 0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
