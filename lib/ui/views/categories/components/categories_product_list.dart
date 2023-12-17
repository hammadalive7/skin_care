import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/data/product_list.dart';
import 'package:skin_care/core/models/product_model.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/categories/components/categories_product_item.dart';

class CategoriesProductList extends StatelessWidget {
  const CategoriesProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
      ),
      child: Obx(() => FutureBuilder(
          future: BaseController.categoriesController
              .fetchProductCategoryData(BaseController.categoriesController.category.value),
          builder: (context, AsyncSnapshot<List<Product>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => CategoriesProductItem(
                  index: index, product: snapshot.data![index]),
            );
          }),
      ),
    );
  }
}
