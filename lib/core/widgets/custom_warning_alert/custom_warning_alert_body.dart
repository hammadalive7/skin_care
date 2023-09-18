
import 'package:flutter/material.dart';

import 'package:skin_care/core/widgets/custom_warning_alert/custom_warning_alert_actions.dart';
import 'package:skin_care/core/widgets/custom_warning_alert/custom_warning_alert_title.dart';

class CustomWarningAlertBody extends StatelessWidget {
  final String title;
  final String? yesTitle;
  final VoidCallback onYesPressed;

  const CustomWarningAlertBody({
    required this.title,
    required this.onYesPressed,
    super.key,
    this.yesTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomWarningAlertTitle(title: title),
        CustomWarningAlertActions(
          yesTitle: yesTitle,
          onYesPressed: onYesPressed,
        ),
      ],
    );
  }
}
