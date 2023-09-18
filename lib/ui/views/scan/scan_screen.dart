
import 'package:flutter/material.dart';
import 'package:skin_care/ui/views/scan/components/scan_app_bar.dart';
import 'package:skin_care/ui/views/scan/components/scan_body.dart';
import 'package:skin_care/ui/views/scan/components/scan_shoe_info.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ScanAppBar(),
      body: ScanBody(),
      extendBodyBehindAppBar: true,
      floatingActionButton: ScanProductInfo(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
