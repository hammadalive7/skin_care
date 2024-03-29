import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_drawer/components/custom_drawer_page_button.dart';
import 'package:skin_care/ui/views/cards/cards_screen.dart';
import 'package:skin_care/ui/views/categories/categories_screen.dart';
import 'package:skin_care/ui/views/notification/notification_screen.dart';
import 'package:skin_care/ui/views/order_summary/order_summary_screen.dart';
import 'package:skin_care/ui/views/questionnaire/basic_info_question_screen.dart';
import 'package:skin_care/ui/views/scan/scan_screen.dart';
import 'package:skin_care/ui/views/search/search_screen.dart';
import 'package:skin_care/ui/views/settings/settings_screen.dart';

class CustomDrawerPageList extends BaseStatelessWidget {
  const CustomDrawerPageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: DeviceUtils.getWidth(context),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDrawerPageButton(
              title: TranslationKeys.allCategories.tr,
              page: const CategoriesScreen(),
            ),
            /*   CustomDrawerPageButton(
              title: "Track Order",
              page: CategoriesScreen(),
            ),*/

            CustomDrawerPageButton(
              title: TranslationKeys.notification.tr,
              page: const NotificationScreen(),
            ),
            CustomDrawerPageButton(
              title: TranslationKeys.search.tr,
              page: const SearchScreen(),
            ),
            CustomDrawerPageButton(
              title: TranslationKeys.location.tr,
              onTap: () => BaseController.trackLocationController
                  .checkLocationPermission(),
            ),
            CustomDrawerPageButton(
              title: TranslationKeys.paymentCards.tr,
              page: const CardsScreen(),
            ),
            CustomDrawerPageButton(
              title: TranslationKeys.orders.tr,
              page: const OrderSummaryScreen(),
            ),
            // CustomDrawerPageButton(
            //   title: TranslationKeys.scan.tr,
            //   page: const ScanScreen(),
            // ),
            CustomDrawerPageButton(
              title: TranslationKeys.settings.tr,
              page: const SettingsScreen(),
            ),
            const CustomDrawerPageButton(
              title: "Questionnaire",
              page: BasicQuestionScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
