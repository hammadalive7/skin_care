
import 'package:flutter/material.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/widgets/custom_color_picker.dart';

class SearchFilterColorPicker extends StatelessWidget {
  const SearchFilterColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: BarColorPicker(
        width: 300,
        thumbColor: Colors.white,
        cornerRadius: 10,
        pickMode: PickMode.color,
        colorListener: (int value) =>
            BaseController.searchProductController.changeFilterColor(Color(value)),
      ),
    );
  }
}
