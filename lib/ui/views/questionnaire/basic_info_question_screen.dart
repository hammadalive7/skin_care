
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/ui/views/home/home_screen.dart';
import 'package:skin_care/ui/views/login/components/login_app_bar.dart';
import 'package:skin_care/ui/views/login/components/login_body.dart';
import 'package:skin_care/ui/views/questionnaire/skin_concern_screen.dart';

import 'components/basic_info_body.dart';

class BasicQuestionScreen extends StatefulWidget {
  const BasicQuestionScreen({Key? key}) : super(key: key);

  @override
  State<BasicQuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<BasicQuestionScreen> {
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
          Get.to(() => const SkinConcernScreen()  );
        },
        child: const Icon(Icons.arrow_forward_ios),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Basic Info",
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: BasicInfoBody(),
    );
  }
}
