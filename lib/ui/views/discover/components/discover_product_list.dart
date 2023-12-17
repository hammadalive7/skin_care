import 'package:flutter/material.dart';
import 'package:skin_care/core/data/product_list.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/product/product_item.dart';

import '../../../../core/models/product_model.dart';
import '../../../../core/utils/base/base_controller.dart';

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
      child: FutureBuilder(
          future: BaseController.productController.fetchProductData(),
          builder: (context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final product = snapshot.data;
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 15,
                childAspectRatio: DeviceUtils.getWidth(context) /
                    DeviceUtils.getDynamicHeight(context, 0.70),
              ),
              itemCount: product!.length,
              itemBuilder: (context, index) => ProductItemView(
                index: index,
                showColor: true,
                product: product[index],
              ),
            );
          }),
    );
  }
}
