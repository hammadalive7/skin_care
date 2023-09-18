
import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/ui/views/enable_location/components/enable_location_enable_now_button.dart';
import 'package:skin_care/ui/views/enable_location/components/enable_location_remind_later_button.dart';

class EnableLocationActions extends BaseStatelessWidget {
  const EnableLocationActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      alignment: WrapAlignment.center,
      children: [
        EnableLocationEnableNowButton(),
        EnableLocationRemindLaterButton(),
      ],
    );
  }
}
