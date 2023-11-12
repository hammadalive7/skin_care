
import 'package:flutter/material.dart';
import 'package:skin_care/core/data/product_list.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/product/product_item.dart';

class DiscoverProductList extends StatelessWidget {
  const DiscoverProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 15,
          childAspectRatio: DeviceUtils.getWidth(context) /
              DeviceUtils.getDynamicHeight(context, 0.90),
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) => ProductItemView(
          index: index,
          showColor: true, product: productList[index],
        ),
      ),
    );
  }
}
