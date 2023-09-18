
import 'package:flutter/material.dart';
import 'package:skin_care/core/models/product_model.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/ui/views/review/components/review_image.dart';
import 'package:skin_care/ui/views/review/components/review_star_rate.dart';
import 'package:skin_care/ui/views/review/components/review_submit_button.dart';
import 'package:skin_care/ui/views/review/components/review_write_review_field.dart';
import 'package:skin_care/ui/views/review/components/review_write_review_title.dart';

class ReviewBody extends BaseStatelessWidget {
  final Product product;

  const ReviewBody({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewImage(image: product.images.first),
          const ReviewStarRate(),
          const ReviewWriteReviewTitle(),
          const ReviewWriteReviewField(),
          const ReviewSubmitButton(),
        ],
      ),
    );
  }
}
