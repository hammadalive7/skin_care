// ignore_for_file: avoid_field_initializers_in_const_classes

/*
Author: XamDesign
Date: 30.05.2023
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xam_shoes_app/core/translations/translation_keys.dart';
import 'package:xam_shoes_app/core/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:xam_shoes_app/core/widgets/custom_app_bar/custom_app_bar_notification_button.dart';
import 'package:xam_shoes_app/ui/views/search/search_screen.dart';

class DiscoverAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const DiscoverAppBar({
    super.key,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: TranslationKeys.discoverAll.tr.toUpperCase(),
      trailing: CustomAppBarNotificationButton(
        icon: "assets/images/search.svg",
        onPressed: () => Get.to(() => const SearchScreen()),
      ),
    );
  }
}