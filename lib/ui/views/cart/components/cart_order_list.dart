
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/translations/translation_keys.dart';
import '../../../../core/utils/base/base_controller.dart';
import '../../../../core/utils/device_utils.dart';
import 'cart_order_item.dart';


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
