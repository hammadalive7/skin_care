
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class OrderSummaryHistoryTitle extends StatelessWidget {
  final String title;

  const OrderSummaryHistoryTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
