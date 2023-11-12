
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';

class HomeCategoryItem extends StatelessWidget {
  final int category;
  final String icon;
  final String title;

  const HomeCategoryItem({
    required this.category,
    required this.icon,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: () {
            HapticFeedback.selectionClick();
            BaseController.homeController.changeCategory(category);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  DeviceUtils.getDynamicHeight(context, 0.04)),
              color:
                  BaseController.homeController.categoryIndex.value == category
                      ? kLightBlueColor
                      : BaseController.themeController.isDark.value
                          ? kDarkFieldColor
                          : kLightFieldColor,
            ),
            padding: const EdgeInsets.all(8.0),
            width: BaseController.homeController.categoryIndex.value == category
                ? DeviceUtils.getDynamicWidth(context, 0.35)
                : DeviceUtils.getDynamicWidth(context, 0.2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon.isNotEmpty)
                  // SvgPicture.asset(
                  //   icon,
                  //   width: 32.0,
                  //   colorFilter: ColorFilter.mode(
                  //     BaseController.homeController.categoryIndex.value ==
                  //             category
                  //         ? kWhiteColor
                  //         : BaseController.themeController.isDark.value
                  //             ? kWhiteColor
                  //             : Colors.black,
                  //     BlendMode.srcIn,
                  //   ),
                  // ),
                // if (BaseController.homeController.categoryIndex.value ==
                //         category ||
                //     icon.isEmpty)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        title,
                        style: context.textTheme.bodyMedium?.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: BaseController
                                      .homeController.categoryIndex.value ==
                                  category
                              ? kWhiteColor
                              : BaseController.themeController.isDark.value
                                  ? kWhiteColor
                                  : Colors.black,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
