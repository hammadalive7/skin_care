

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';

class CustomBottomSheetTitle extends BaseStatelessWidget {
  final String title;

  const CustomBottomSheetTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
