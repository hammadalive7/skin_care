import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/data/product_list.dart';
import 'package:skin_care/core/models/product_model.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/base/base_statefull.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/home/components/home_carousel.dart';
import 'package:skin_care/ui/views/product/product_item.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/ui/views/detail/detail_screen.dart';
import 'package:skin_care/ui/views/product/product_item_cart.dart';
import 'package:skin_care/ui/views/product/product_item_fav_button.dart';
import 'package:skin_care/ui/views/product/product_item_image.dart';
import 'package:skin_care/ui/views/product/product_price.dart';
import 'package:skin_care/ui/views/product/product_stock_left.dart';
import 'package:skin_care/ui/views/navigation/navigation_screen.dart';

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
            padding: EdgeInsets.symmetric(
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
                InkWell(
                  splashColor: Colors.grey.withOpacity(0.2),
                  onTap: () {
                    BaseController.navigationController.changeScreen(1);
                    Get.to(() => const NavigationScreen(),
                        transition: Transition.cupertino);
                  },
                  child: Text(
                    "See All",
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: DeviceUtils.getDynamicWidth(context, 0.02),
            ),
            child: SizedBox(
              height: 270,
              width: DeviceUtils.getWidth(context) * 0.92,
              child: FutureBuilder(
                  future: BaseController.productController.fetchProductData(),
                  builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    if (snapshot.data == null) {
                      return const Center(
                        child: Text('No data found'),
                      );
                    }
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length, // Number of cards
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Get.to(() =>
                                DetailScreen(product: snapshot.data![index])),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(
                                    () {
                                      return Container(
                                        width: DeviceUtils.getDynamicWidth(
                                            context, 0.40),
                                        height: DeviceUtils.getDynamicHeight(
                                            context, 0.27),
                                        padding: const EdgeInsets.all(12.0),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                          border: Border.all(
                                            color: BaseController
                                                    .themeController
                                                    .isDark
                                                    .value
                                                ? kDarkStrokeColor
                                                : kLightTextSecondaryColor
                                                    .withOpacity(0.2),
                                            width: 1,
                                          ),
                                          color: BaseController
                                                  .themeController.isDark.value
                                              ? kDarkFieldColor
                                              : kLightFieldColor,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                ProductItemImage(
                                                  index: index,
                                                  productImage: snapshot
                                                      .data![index].images,
                                                ),
                                                ProductItemFavButton(
                                                    index: index),
                                                ProductItemCartButton(
                                                  productModel:
                                                      snapshot.data![index],
                                                ),
                                                if (productList[index].stock! <
                                                    5)
                                                  ProductStockLeft(
                                                      index: index),
                                              ],
                                            ),
                                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                            ProductPrice(
                                              productIndex: index,
                                              productPrice: snapshot
                                                  .data![index].retailPrice,
                                              productName:
                                                  snapshot.data![index].name,
                                            ),
                                            // Text(
                                            //   snapshot.data![index].name ?? "",
                                            //   style: context.textTheme.titleMedium?.copyWith(
                                            //     fontWeight: FontWeight.w300,
                                            //     overflow: TextOverflow.ellipsis,
                                            //   ),
                                            //   maxLines: 1,
                                            // ),
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
                      );
                    } else {
                      return const Center(
                        child: Text('No data found'),
                      );
                    }
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
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
                InkWell(
                  splashColor: Colors.grey.withOpacity(0.2),
                  onTap: () {
                    BaseController.navigationController.changeScreen(1);
                    Get.to(() => const NavigationScreen(),
                        transition: Transition.cupertino);
                  },
                  child: Text(
                    "See All",
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: DeviceUtils.getDynamicHeight(context, 0.02),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: DeviceUtils.getDynamicWidth(context, 0.05),
            ),
            child: FutureBuilder(
                future: BaseController.productController.fetchProductData(),
                builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text('No data found'),
                    );
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 15,
                      childAspectRatio: DeviceUtils.getWidth(context) /
                          DeviceUtils.getDynamicHeight(context, 0.70),
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => ProductItemView(
                      index: index,
                      product: snapshot.data![index],
                    ),
                  );
                }),
          ),

          // SizedBox(height: 130,)
        ],
      ),
    );
  }
}
