
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/models/product_model.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/widgets/custom_material_button.dart';
import 'package:skin_care/ui/views/detail/detail_screen.dart';

class SearchLastSeenItem extends StatelessWidget {
  final Product product;

  const SearchLastSeenItem({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: Container(
          width: 96,
          height: 96,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomMaterialButton(
            backgroundColor: BaseController.themeController.isDark.value
                ? kDarkFieldColor
                : kLightFieldColor,
            borderRadius: BorderRadius.circular(16.0),
            onTap: () {
              Get.to(() => DetailScreen(product: product));
            },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                product.images.first,
                width: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
