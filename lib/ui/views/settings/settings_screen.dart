
import 'package:flutter/material.dart';

import 'package:skin_care/ui/views/settings/components/settings_app_bar.dart';
import 'package:skin_care/ui/views/settings/components/settings_body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SettingsAppBar(),
      body: SettingsBody(),
    );
  }
}
