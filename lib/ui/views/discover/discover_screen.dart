
import 'package:flutter/material.dart';

import 'package:skin_care/ui/views/discover/components/discover_app_bar.dart';
import 'package:skin_care/ui/views/discover/components/discover_body.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DiscoverAppBar(),
      body: DiscoverBody(),
    );
  }
}
