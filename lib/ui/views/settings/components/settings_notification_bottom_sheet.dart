
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/widgets/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:skin_care/ui/views/settings/components/settings_bottom_sheet_apply_button.dart';
import 'package:skin_care/ui/views/settings/components/settings_notification_bottom_sheet_notification_row.dart';

class SettingsNotificationBottomSheet extends StatefulWidget {
  const SettingsNotificationBottomSheet({
    super.key,
  });

  @override
  State<SettingsNotificationBottomSheet> createState() =>
      _SettingsNotificationBottomSheetState();
}

class _SettingsNotificationBottomSheetState
    extends State<SettingsNotificationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: TranslationKeys.notification.tr.toUpperCase(),
      content: Column(
        children: [
          const SettingsNotificationBottomSheetNotificationRow(),
          const SizedBox(height: 8.0),
          SettingsBottomSheetApplyButton(onTap: () => Get.back()),
        ],
      ),
    );
  }
}
