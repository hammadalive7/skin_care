import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/models/cart_item_model.dart';
import 'package:skin_care/core/widgets/custom_loading_button.dart';
import '../../models/product_model.dart';

class CartController extends GetxController {
  RxList<CartItem> cartItemList = <CartItem>[].obs;
  RxDouble cartTotal = 0.0.obs;
  RxDouble shippingCost = 80.0.obs;
  RxDouble cartTotalWithShippingCost = 0.0.obs;
  final RoundedLoadingButtonController addToCartButtonController =
      RoundedLoadingButtonController();

  Future<void> storeCartProduct(Product product) async {
    try {
      // Check if the product is already in the 'ProductCart' collection
      final cartQuery = await FirebaseFirestore.instance
          .collection('ProductCart')
          .where("id", isEqualTo: product.id)
          .get();

      if (cartQuery.docs.isNotEmpty) {
        // If the product is already in the cart, update the piece and price
        final cartDoc = cartQuery.docs.first;
        final int currentPiece = cartDoc['piece'] ?? 0;
        final double currentPrice = cartDoc['price'] ?? 0.0;

        cartDoc.reference.update({
          'piece': currentPiece + 1,
          'price': currentPrice + product.retailPrice,
        });
      } else {
        // If the product is not in the cart, add a new document
        await FirebaseFirestore.instance.collection('ProductCart').add({
          'id': product.id,
          'productName': product.name, // Replace with actual field names
          'price': product.retailPrice,
          'image': product.images.first,
          'piece': 1,
          // Add other fields as needed
        });
      }

    } catch (e) {
      debugPrint(' ---- error: $e');
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Stream<List<CartItem>> getCartItemsStream() {
    try {
      final cartCollection =
      FirebaseFirestore.instance.collection('ProductCart');

      return cartCollection.snapshots().map((querySnapshot) {
        return querySnapshot.docs.map((doc) {
          return CartItem(
            id: doc['id'],
            productName: (doc['productName'] as String).obs,
            price: (doc['price'] as double).obs,
            piece: (doc['piece'] as int).obs,
            image: (doc['image'] as String).obs,
          );
        }).toList();
      });
    } catch (e) {
      debugPrint(' ---- error: $e');
      throw e;
    }
  }
  // bool addItemToCart(int productId) {
  //   final productItem =
  //       cartItemList.firstWhereOrNull((item) => item.product.id == productId);
  //   if (productItem == null) {
  //     cartItemList.add(
  //       CartItem(
  //         product: productList.firstWhere((product) => product.id == productId),
  //         piece: 1.obs,
  //       ),
  //     );
  //     calculateTotal();
  //     return true;
  //   } else {
  //     if (productList.firstWhere((product) => product.id == productId).stock ==
  //         productItem.piece.value) {
  //       calculateTotal();
  //       return false;
  //     }
  //     cartItemList.firstWhere((item) => item.product.id == productId).piece++;
  //     calculateTotal();
  //     return true;
  //   }
  // }

  // void increaseCartItemPiece(int index) {
  //   if (cartItemList[index].piece.value == cartItemList[index].product.stock) {
  //     return;
  //   }
  //   cartItemList[index].piece++;
  //   calculateTotal();
  // }

  // void decreaseCartItemPiece(int index, BuildContext context) {
  //   if (cartItemList[index].piece > 1) {
  //     cartItemList[index].piece--;
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) => CustomWarningAlert(
  //         title: TranslationKeys.removeItemWarning.tr,
  //         onYesPressed: () {
  //           BaseController.cartController.deleteItemFromCart(index);
  //           Get.back();
  //         },
  //       ),
  //     );
  //   }
  //
  //   calculateTotal();
  // }

  void deleteItemFromCart(CartItem cartItem) {
    // remove it from firestore
    FirebaseFirestore.instance
        .collection('ProductCart')
        .where('id', isEqualTo: cartItem.id)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.reference.delete();
      });
    });
  }

  void increaseCartItemPiece(CartItem cartItem) {
    FirebaseFirestore.instance
        .collection('ProductCart')
        .where('id', isEqualTo: cartItem.id)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.reference.update({
          'piece': cartItem.piece.value + 1,
          'price': cartItem.price.value + (cartItem.price.value/cartItem.piece.value),
        });
      });
    });
  }

  void decreaseCartItemPiece(CartItem cartItem) {
    FirebaseFirestore.instance
        .collection('ProductCart')
        .where('id', isEqualTo: cartItem.id)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.reference.update({
          'piece': cartItem.piece.value - 1,
          'price': cartItem.price.value - (cartItem.price.value/cartItem.piece.value),
        });
      });
    });
  }

  double calculateDiscount(double retailPrice, int discountRate) {
    return retailPrice - (retailPrice * (discountRate / 100));
  }

  // void calculateTotal() {
  //   cartTotal.value = 0.0;
  //   for (final cartItem in cartItemList) {
  //     cartTotal.value += (cartItem.product.discountRate != null
  //             ? calculateDiscount(
  //                 cartItem.product.retailPrice, cartItem.product.discountRate!)
  //             : cartItem.product.retailPrice) *
  //         cartItem.piece.value;
  //   }
  //   cartTotalWithShippingCost.value = cartTotal.value + shippingCost.value;
  // }

  void reset() {
    cartItemList.clear();
    cartTotal.value = 0.0;
    cartTotalWithShippingCost.value = 0.0;
  }
}
