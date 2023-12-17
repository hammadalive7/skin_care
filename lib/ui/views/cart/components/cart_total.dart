import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/models/cart_item_model.dart';

class CartTotal extends StatelessWidget {
  final List<CartItem> product;

  const CartTotal({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double calculateTotal() {
      double total = 0;
      for (var i = 0; i < product.length; i++) {
        total += product[i].price.toDouble();
      }
      return total;
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
        vertical: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            TranslationKeys.total.tr,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: kLightTextSecondaryColor,
                ),
          ),
          Obx(
            () => Text(
              "\$ ${calculateTotal().toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
