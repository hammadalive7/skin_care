
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/widgets/custom_material_button.dart';
import 'package:skin_care/ui/views/home/components/home_filter_bottom_sheet.dart';

class HomeFilterButton extends StatelessWidget {
  const HomeFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomMaterialButton(
      backgroundColor: kRedColor,
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(24.0),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => const HomeFilterBottomSheet(),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 16.0,
        ),
        child: SvgPicture.asset("assets/images/filter.svg"),
      ),
    );
  }
}
