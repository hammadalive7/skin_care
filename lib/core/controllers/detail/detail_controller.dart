
import 'dart:ui';

import 'package:get/get.dart';
import 'package:skin_care/core/data/product_list.dart';

class DetailController extends GetxController {
  Rx<Color> selectedColor = productList.first.colors.first.obs;
  RxBool showDetails = false.obs;

  void changeColor(Color color) {
    selectedColor.value = color;
  }

  void reset() {
    selectedColor.value = productList.first.colors.first;
  }
}
