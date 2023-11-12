

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/data/product_list.dart';
import 'package:skin_care/core/models/cart_item_model.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/widgets/custom_loading_button.dart';
import 'package:skin_care/core/widgets/custom_warning_alert/custom_warning_alert.dart';


class CartController extends GetxController {
  RxList<CartItem> cartItemList = <CartItem>[].obs;
  RxDouble cartTotal = 0.0.obs;
  RxDouble shippingCost = 80.0.obs;
  RxDouble cartTotalWithShippingCost = 0.0.obs;
  final RoundedLoadingButtonController addToCartButtonController =
  RoundedLoadingButtonController();

  bool addItemToCart(int productId) {
    final productItem =
    cartItemList.firstWhereOrNull((item) => item.product.id == productId);
    if (productItem == null) {
      cartItemList.add(
        CartItem(
          product: productList.firstWhere((shoe) => shoe.id == productId),
          piece: 1.obs,
        ),
      );
      calculateTotal();
      return true;
    } else {
      if (productList
          .firstWhere((shoe) => shoe.id == productId)
          .stock ==
          productItem.piece.value) {
        calculateTotal();
        return false;
      }
      cartItemList
          .firstWhere((item) => item.product.id == productId)
          .piece++;
      calculateTotal();
      return true;
    }
  }

  void increaseCartItemPiece(int index) {
    if (cartItemList[index].piece.value == cartItemList[index].product.stock) {
      return;
    }
    cartItemList[index].piece++;
    calculateTotal();
  }

  void decreaseCartItemPiece(int index, BuildContext context) {
    if (cartItemList[index].piece > 1) {
      cartItemList[index].piece--;
    }
    else {
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            CustomWarningAlert(
              title: TranslationKeys.removeItemWarning.tr,
              onYesPressed: () {
                BaseController.cartController.deleteItemFromCart(index);
                Get.back();
              },
            ),
      );
    }

    calculateTotal();
  }

  void deleteItemFromCart(int index) {
    cartItemList.removeAt(index);
    calculateTotal();
  }

  double calculateDiscount(double retailPrice, int discountRate) {
    return retailPrice - (retailPrice * (discountRate / 100));
  }

  void calculateTotal() {
    cartTotal.value = 0.0;
    for (final cartItem in cartItemList) {
      cartTotal.value += (cartItem.product.discountRate != null
          ? calculateDiscount(
          cartItem.product.retailPrice, cartItem.product.discountRate!)
          : cartItem.product.retailPrice) *
          cartItem.piece.value;
    }
    cartTotalWithShippingCost.value = cartTotal.value + shippingCost.value;
  }

  void reset() {
    cartItemList.clear();
    cartTotal.value = 0.0;
    cartTotalWithShippingCost.value = 0.0;
  }
}
