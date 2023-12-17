

import 'package:flutter/material.dart';
import 'package:skin_care/core/models/cart_item_model.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/ui/views/cart/components/cart_order_item_piece_button.dart';
import 'package:skin_care/ui/views/cart/components/cart_order_item_piece_text.dart';

class CartOrderItemPiece extends StatelessWidget {
  final int index;
  final int productPiece;
  final CartItem cartItem;

  const CartOrderItemPiece({
    required this.index,
    required this.productPiece,
    required this.cartItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartOrderItemPieceButton(
          index: index,
          icon: Icons.remove_circle_outline,
          onTap: () {
            BaseController.cartController.decreaseCartItemPiece(cartItem);
          }
              // BaseController.cartController
              // .decreaseCartItemPiece(index, context),
        ),
        const SizedBox(width: 16.0),
        CartOrderItemPieceText(index: index, productPiece: productPiece),
        const SizedBox(width: 16.0),
        CartOrderItemPieceButton(
          index: index,
          icon: Icons.add_circle_outline,
          onTap: () {
            BaseController.cartController.increaseCartItemPiece(cartItem);
          }
              // BaseController.cartController.increaseCartItemPiece(index),
        ),
      ],
    );
  }
}
