
import 'package:flutter/material.dart';
import 'package:skin_care/core/data/product_list.dart';
import 'package:skin_care/core/models/cart_item_model.dart';
import 'package:skin_care/ui/views/cart/components/cart_order_item_piece.dart';
import 'package:skin_care/ui/views/product/product_price.dart';

class CartOrderItemInfo extends StatelessWidget {
  final int index;
  final String model;
  final double retailPrice;
  final int piece;
  final CartItem cartItem;

  const CartOrderItemInfo({
    required this.index,
    required this.piece,
    required this.model,
    required this.retailPrice,
    required this.cartItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductPrice(productIndex: index, productPrice: retailPrice, productName: model),
          const SizedBox(height: 16.0),
          CartOrderItemPiece(index: index, productPiece: piece, cartItem: cartItem),
        ],
      ),
    );
  }
}
