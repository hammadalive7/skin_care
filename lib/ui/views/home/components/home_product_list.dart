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
import 'package:skin_care/core/models/products_model.dart';
import 'package:skin_care/ui/views/detail/detail_screen.dart';
import 'package:skin_care/ui/views/product/product_item_cart.dart';
import 'package:skin_care/ui/views/product/product_item_fav_button.dart';
import 'package:skin_care/ui/views/product/product_item_image.dart';
import 'package:skin_care/ui/views/product/product_price.dart';
import 'package:skin_care/ui/views/product/product_stock_left.dart';

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
                  Text(
                    "See All",
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              )),
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
                  debugPrint("-- snapshot data: " + snapshot.data.toString());
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
                  if(snapshot.hasData){
                    print("---------- snapshot data");
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:  snapshot.data!.length, // Number of cards
                      itemBuilder: (context, index) {
                        debugPrint("image" + snapshot.data![index].images.toString());
                        return GestureDetector(
                          onTap: () =>
                              Get.to(() => DetailScreen(product: productList[index])),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(
                                      () {
                                    return Container(
                                      width:
                                      DeviceUtils.getDynamicWidth(context, 0.45),
                                      height:
                                      DeviceUtils.getDynamicHeight(context, 0.27),
                                      padding: const EdgeInsets.all(12.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: BaseController
                                              .themeController.isDark.value
                                              ? kDarkStrokeColor
                                              : kLightTextSecondaryColor
                                              .withOpacity(0.2),
                                          width: 1,
                                        ),
                                        color: BaseController
                                            .themeController.isDark.value
                                            ? kDarkFieldColor
                                            : kLightFieldColor,
                                        borderRadius: BorderRadius.circular(24.0),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              ProductItemImage(index: index, productImage: snapshot.data![index].images,),
                                              ProductItemFavButton(index: index),
                                              ProductItemCartButton(
                                                productModel: productList[index],
                                              ),
                                              if (productList[index].stock! < 5)
                                                ProductStockLeft(index: index),
                                            ],
                                          ),
                                          const SizedBox(height: 15),
                                          ProductPrice(productIndex: index, productPrice: snapshot.data![index].retailPrice, productName: snapshot.data![index].name,),
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
                  } else{
                    return const Center(
                      child: Text('No data found'),
                    );
                  }
                }
              ),
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
                Text(
                  "see all",
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w300,
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
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 15,
                    childAspectRatio: DeviceUtils.getWidth(context) /
                        DeviceUtils.getDynamicHeight(context, 0.79),
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => ProductItemView(index: index, product: snapshot.data![index],),
                );
              }
            ),
          ),

          // SizedBox(height: 130,)
        ],
      ),
    );
  }
}
