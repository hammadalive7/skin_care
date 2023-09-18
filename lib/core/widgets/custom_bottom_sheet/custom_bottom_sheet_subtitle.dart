

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';

class CustomBottomSheetSubtitle extends BaseStatelessWidget {
  final String title;

  const CustomBottomSheetSubtitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: context.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
