
import 'package:flutter/material.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/home/components/home_category_item.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceUtils.getWidth(context),
      height: DeviceUtils.getDynamicHeight(context, 0.06),
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: const [
          HomeCategoryItem(
            category: 0,
            icon: "assets/images/nike_logo.svg",
            title: "All",
          ),
          HomeCategoryItem(
            category: 1,
            icon: "assets/images/nike_logo.svg",
            title: "Face Wash",
          ),
          HomeCategoryItem(
            category: 2,
            icon: "assets/images/adidas_logo.svg",
            title: "Scrubs",
          ),
          HomeCategoryItem(
            category: 3,
            icon: "assets/images/puma_logo.svg",
            title: "Moisturizers",
          ),
          HomeCategoryItem(
            category: 4,
            icon: "assets/images/nike_logo.svg",
            title: "Sunscreen",
          ),
          HomeCategoryItem(
            category: 5,
            icon: "assets/images/adidas_logo.svg",
            title: "Face Masks",
          ),
          HomeCategoryItem(
            category: 6,
            icon: "assets/images/puma_logo.svg",
            title: "Face Packs",
          ),
        ],
      ),
    );
  }
}
