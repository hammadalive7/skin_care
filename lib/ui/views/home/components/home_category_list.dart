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
      height: DeviceUtils.getDynamicHeight(context, 0.09),
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: const [
          HomeCategoryItem(
            category: 0,
            icon: "icon.png",
            title: "All",
          ),
          HomeCategoryItem(
            category: 1,
            icon: "icon.png",
            title: "Serums",
          ),
          HomeCategoryItem(
            category: 2,
            icon: "icon.png",
            title: "Scrubs",
          ),
          HomeCategoryItem(
            category: 3,
            icon: "icon.png",
            title: "Moisturiser",
          ),
          HomeCategoryItem(
            category: 4,
            icon: "icon.png",
            title: "Cleanser",
          ),
          HomeCategoryItem(
            category: 5,
            icon: "icon.png",
            title: "Mask",
          ),
        ],
      ),
    );
  }
}
