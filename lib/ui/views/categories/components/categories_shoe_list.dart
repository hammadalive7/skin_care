
import 'package:flutter/material.dart';

import 'package:skin_care/core/data/product_list.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/categories/components/categories_shoe_item.dart';

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
      child: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) => CategoriesProductItem(index: index),
      ),
    );
  }
}
