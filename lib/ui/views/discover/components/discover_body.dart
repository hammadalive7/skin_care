
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/discover/components/discover_product_list.dart';
import 'package:skin_care/ui/views/discover/components/discover_title.dart';

class DiscoverBody extends StatelessWidget {
  const DiscoverBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceUtils.getHeight(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideInLeft(from: 10, child: const DiscoverTitle()),
          Expanded(child: FadeInUp(from: 10, child: const DiscoverProductList())),
        ],
      ),
    );
  }
}
