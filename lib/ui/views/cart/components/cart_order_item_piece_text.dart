
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';

class CartOrderItemPieceText extends StatelessWidget {
  final int index;
  final int productPiece;

  const CartOrderItemPieceText({
    required this.index,
    required this.productPiece,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
          Text(
            productPiece.toString(),
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
    );
  }
}
