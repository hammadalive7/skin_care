
import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/detail/components/detail_color_list.dart';
import 'package:skin_care/ui/views/detail/components/detail_title.dart';

class DetailInfo extends StatelessWidget {
  final String model;
  // final List<Color> colors;

  const DetailInfo({
    required this.model,
    // required this.colors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
        vertical: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: DetailTitle(model: model)),
          // Expanded(flex: 2, child: DetailColorList(colors: colors)),
        ],
      ),
    );
  }
}
