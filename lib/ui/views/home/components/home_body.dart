import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:skin_care/core/utils/base/base_statefull.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/home/components/home_filter_button.dart';
import 'package:skin_care/ui/views/home/components/home_product_list.dart';
import 'package:skin_care/ui/views/home/components/home_title.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });
  @override
  State<HomeBody> createState() => _HomeBodyState();
}
class _HomeBodyState extends BaseState<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceUtils.getHeight(context),
      child: Stack(
        children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SlideInLeft(from: 10, child: const HomeTitle()),
                // if (BaseController.homeController.isShowCategoryList.value)
                //   FadeInDown(from: 10, child: const HomeCategoryList()),
                Expanded(
                    child: FadeInUp(from: 10, child: const HomeProductList())),
              ],
            ),
          // Positioned(
          //   right: 0,
          //   top: 10,
          //   child: SlideInRight(from: 10, child: const HomeFilterButton()),
          // ),
        ],
      ),
    );
  }
}
