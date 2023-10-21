
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/models/product_model.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/detail/components/detail_property_text.dart';

class DetailProperties extends StatefulWidget {
  final Product product;

  const DetailProperties({
    required this.product,
    super.key,
  });

  @override
  State<DetailProperties> createState() => _DetailPropertiesState();
}

class _DetailPropertiesState extends State<DetailProperties> {
  @override
  void dispose() {
    BaseController.detailController.showDetails.value = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
        vertical: 16.0,
      ),
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TranslationKeys.structure.tr,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16.0),
            DetailPropertyText(
              title: "${TranslationKeys.outerMaterial.tr}:",
              description: widget.product.category,
            ),
            DetailPropertyText(
              title: "${TranslationKeys.lining.tr}:",
              description: widget.product.tags,
            ),
            DetailPropertyText(
              title: "${TranslationKeys.sole.tr}:",
              description: widget.product.category,
            ),
            Offstage(
              offstage: !BaseController.detailController.showDetails.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailPropertyText(
                    title: "${TranslationKeys.brand.tr}:",
                    description: widget.product.brand,
                  ),
                  DetailPropertyText(
                    title: "${TranslationKeys.gender.tr}:",
                    description: widget.product.description,
                  ),
                  DetailPropertyText(
                    title: "${TranslationKeys.year.tr}:",
                    description: widget.product.use,
                  ),
                ],
              ),
            ),
            Offstage(
              offstage: BaseController.detailController.showDetails.value,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    BaseController.detailController.showDetails.value =
                        !BaseController.detailController.showDetails.value;
                  },
                  child: Text(
                    "... ${TranslationKeys.details.tr}",
                    style: context.textTheme.titleSmall?.copyWith(
                      color: kLightBlueColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
