
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/cart/components/cart_order_item.dart';


class CartOrderList extends StatelessWidget {
  const CartOrderList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
        ),
        child: BaseController.cartController.cartItemList.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: BaseController.cartController.cartItemList.length,
                itemBuilder: (context, index) => CartOrderItem(
                  index: index,
                  cartItem: BaseController.cartController.cartItemList[index],
                ),
              )
            : Center(
                child: Text(TranslationKeys.cartIsEmpty.tr),
              ),
      ),
    );
  }
}
