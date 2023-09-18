
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/models/product_model.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/widgets/custom_submit_button.dart';
import 'package:skin_care/ui/views/review/review_screen.dart';

class TrackOrderReviewButton extends BaseStatelessWidget {
  final Product product;

  const TrackOrderReviewButton({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSubmitButton(
      title: "Review this product",
      onTap: () => Get.to(
        () => ReviewScreen(product: product),
      ),
    );
  }
}
