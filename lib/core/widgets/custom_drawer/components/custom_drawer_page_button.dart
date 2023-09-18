
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';

class CustomDrawerPageButton extends BaseStatelessWidget {
  final String title;
  final Widget? page;
  final VoidCallback? onTap;

  const CustomDrawerPageButton({
    required this.title,
    super.key,
    this.page,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap ?? () => Get.to(() => page!),
      child: Text(
        title,
        style: context.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
