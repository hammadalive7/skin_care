
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/cart/components/cart_order_item.dart';

import '../../../../core/models/cart_item_model.dart';


class CartOrderList extends StatelessWidget {
  final List<CartItem> data;
  const CartOrderList({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.symmetric(
          horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
        ),
        child:
             data.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) => CartOrderItem(
                      index: index,
                      cartItem: data[index],
                    ),
                  )
                : Center(
                    child: Text(TranslationKeys.cartIsEmpty.tr),
                  ),
      );
  }
}
