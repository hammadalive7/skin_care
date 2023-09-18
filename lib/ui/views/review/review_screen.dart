
import 'package:flutter/material.dart';

import 'package:skin_care/core/models/product_model.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/ui/views/review/components/review_app_bar.dart';
import 'package:skin_care/ui/views/review/components/review_body.dart';

class ReviewScreen extends BaseStatelessWidget {
  final Product product;

  const ReviewScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReviewAppBar(),
      body: ReviewBody(product: product),
    );
  }
}
