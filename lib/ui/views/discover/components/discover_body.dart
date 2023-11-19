
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/discover/components/discover_product_list.dart';
import 'package:skin_care/ui/views/discover/components/discover_title.dart';

import '../../../../core/utils/base/base_controller.dart';
import '../../home/components/home_category_list.dart';

class DiscoverBody extends StatelessWidget {
  const DiscoverBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceUtils.getHeight(context),
      child: Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SlideInLeft(from: 10, child: const DiscoverTitle()),
          if (BaseController.homeController.isShowCategoryList.value)
            FadeInDown(from: 10, child: const HomeCategoryList()),
          SizedBox(height: MediaQuery.sizeOf(context).height * .03,),
          Expanded(child: FadeInUp(from: 10, child: const DiscoverProductList())),
        ],
      ),
    )
    );
  }
}
