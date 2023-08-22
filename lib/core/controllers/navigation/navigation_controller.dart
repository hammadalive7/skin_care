/*
Author: XamDesign
Date: 25.05.2023
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;
  GlobalKey<ScaffoldState> navigationScaffoldKey = GlobalKey<ScaffoldState>();

  void changeScreen(int index) {
    selectedIndex.value = index;
  }

  void reset() {
    selectedIndex.value = 0;
  }
}
