import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/data/product_list.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';

class ProductPrice extends StatefulWidget {
  final int productIndex;
  final double productPrice;
  final String? productName;

  const ProductPrice(
      {required this.productIndex,
      required this.productPrice,
      this.productName,
      super.key});

  @override
  State<ProductPrice> createState() => _ProductPriceState();
}

class _ProductPriceState extends State<ProductPrice> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  "${widget.productName}",
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w300,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
              // if (productList[widget.productIndex].discountRate != null &&
              //     productList[widget.productIndex].discountRate != 0)
              //   Container(
              //     decoration: BoxDecoration(
              //       color: kLightBlueColor,
              //       borderRadius: BorderRadius.circular(8.0),
              //     ),
              //     margin: const EdgeInsets.only(top: 4.0),
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 4.0,
              //     ),
              //     child: Text(
              //       "${productList[widget.productIndex].discountRate}%",
              //       style: context.textTheme.labelSmall?.copyWith(
              //         color: kWhiteColor,
              //         fontSize: 12,
              //         fontWeight: FontWeight.w400,
              //       ),
              //     ),
              //   ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // if (productList[widget.productIndex].discountRate != null &&
              //     productList[widget.productIndex].discountRate != 0)
              //   Text(
              //     "\$${(BaseController.homeController.calculateDiscount(widget.productPrice, productList[widget.productIndex].discountRate!)).toStringAsFixed(2)}",
              //     style: context.textTheme.titleMedium?.copyWith(
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
              Text(
                "\$${widget.productPrice.toStringAsFixed(2)}",
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight:
                      // (productList[widget.productIndex].discountRate != null &&
                      //         productList[widget.productIndex].discountRate != 0)
                      //     ? FontWeight.w300
                      //     :
                      FontWeight.w600,
                  // decoration:
                  //     (productList[widget.productIndex].discountRate != null &&
                  //             productList[widget.productIndex].discountRate != 0)
                  //         ? TextDecoration.lineThrough
                  //         : null,
                  // fontSize: (productList[widget.productIndex].discountRate != null &&
                  //         productList[widget.productIndex].discountRate != 0)
                  //     ? 14
                  //     : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
