
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/widgets/custom_star_rate.dart';

class ReviewStarRate extends BaseStatelessWidget {
  const ReviewStarRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomSelectableStarRate(
        key: UniqueKey(),
        value: BaseController.reviewController.rating.value,
        starSize: 30.0,
        onRatingChanged: (val) =>
            BaseController.reviewController.changeRating(val),
      ),
    );
  }
}
