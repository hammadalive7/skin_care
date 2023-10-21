
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/data/product_list.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/base/base_statefull.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/home/components/home_carousel.dart';
import 'package:skin_care/ui/views/product/product_item.dart';

import '../../../../core/constants/color_constants.dart';
import '../../detail/detail_screen.dart';
import '../../product/product_item_cart.dart';
import '../../product/product_item_fav_button.dart';
import '../../product/product_item_image.dart';
import '../../product/product_price.dart';
import '../../product/product_stock_left.dart';

class HomeProductList extends StatefulWidget {
  const HomeProductList({
    super.key,
  });

  @override
  State<HomeProductList> createState() => _HomeProductListState();
}

class _HomeProductListState extends BaseState<HomeProductList> {
  @override
  void initState() {
    // hide item when scroll down
    BaseController.homeController.productListController
        .addListener(BaseController.homeController.scrollListenerProductsList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: BaseController.homeController.productListController,
      child: Column(
        children: [
          const HomeCarousel(),
          Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: DeviceUtils.getDynamicWidth(context, 0.05),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Arrivals",
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "See All",
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              )
          ),
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: DeviceUtils.getDynamicWidth(context, 0.02),
            ),            child: Container(
            height: 200, // Adjust the height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Number of cards
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Get.to(() => DetailScreen(product: productList[index])),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                              () {
                            return Container(
                              width: DeviceUtils.getDynamicWidth(context, 0.5),
                              height: DeviceUtils.getDynamicHeight(context, 0.2),
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: BaseController.themeController.isDark.value
                                      ? kDarkStrokeColor
                                      : kLightTextSecondaryColor.withOpacity(0.2),
                                  width: 1,
                                ),
                                color: BaseController.themeController.isDark.value
                                    ? kDarkFieldColor
                                    : kLightFieldColor,
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Stack(
                                children: [
                                  ProductItemImage(index: index),
                                  ProductItemFavButton(index: index),
                                  ProductItemCartButton(
                                    productModel: productList[index],
                                  ),
                                  if (productList[index].stock! < 5) ProductStockLeft(index: index),
                                ],
                              ),
                            );
                          },
                        ),

                      ],
                    ),
                  ),
                );


              },
            ),
          ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: DeviceUtils.getDynamicWidth(context, 0.05),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Best Sellers",
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "See All",
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          SizedBox( height: DeviceUtils.getDynamicHeight(context, 0.02),),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: DeviceUtils.getDynamicWidth(context, 0.05),
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 15,
                childAspectRatio: DeviceUtils.getWidth(context) /
                    DeviceUtils.getDynamicHeight(context, 0.79),
              ),
              itemCount: productList.length,
              itemBuilder: (context, index) => ProductItemView(index: index),
            ),
          ),

          // SizedBox(height: 130,)
        ],
      ),
    );
  }
}
