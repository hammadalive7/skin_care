
import 'package:flutter/material.dart';
import 'package:skin_care/core/data/product_list.dart';
import 'package:skin_care/ui/views/cart/components/cart_order_item_piece.dart';
import 'package:skin_care/ui/views/product/product_price.dart';

class CartOrderItemInfo extends StatelessWidget {
  final int index;
  final String model;
  final double retailPrice;

  const CartOrderItemInfo({
    required this.index,
    required this.model,
    required this.retailPrice,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductPrice(productIndex: productList.indexWhere((e) => e.model == model)),
          const SizedBox(height: 16.0),
          CartOrderItemPiece(index: index),
        ],
      ),
    );
  }
}
