



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/ui/views/home/home_screen.dart';
import 'package:skin_care/ui/views/login/components/login_app_bar.dart';
import 'package:skin_care/ui/views/login/components/login_body.dart';
import 'package:skin_care/ui/views/navigation/navigation_screen.dart';

import 'components/basic_info_body.dart';
import 'components/skin_concern_body.dart';

class SkinConcernScreen extends StatefulWidget {
  const SkinConcernScreen({Key? key}) : super(key: key);

  @override
  State<SkinConcernScreen> createState() => _ConcernScreenState();
}

class _ConcernScreenState extends State<SkinConcernScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat ,
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          Get.to(() => const NavigationScreen()  );
        },
        child: const Icon(Icons.arrow_forward_ios),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Lifestyle & Skin Concerns",
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SkinConcernBody(),
    );
  }
}
