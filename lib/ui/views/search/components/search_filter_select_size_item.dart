
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/data/filter_size_list.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';

class SearchFilterSelectSizeItem extends StatelessWidget {
  final int index;

  const SearchFilterSelectSizeItem({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: () =>
                  BaseController.searchProductController.changeFilterSize(index),
              child: Container(
                width: DeviceUtils.getDynamicWidth(context, 0.18),
                decoration: BoxDecoration(
                  color:
                  BaseController.searchProductController.filterSizeIndex.value ==
                      index
                      ? kLightBlueColor
                      : BaseController.themeController.isDark.value
                      ? kDarkFieldColor
                      : kLightTextSecondaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    filterSizeList[index],
                    style: context.textTheme.titleSmall?.copyWith(
                      color: BaseController
                          .searchProductController.filterSizeIndex.value ==
                          index
                          ? kWhiteColor
                          : null,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
