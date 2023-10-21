

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/widgets/custom_drawer/components/custom_drawer_page_list.dart';
import 'package:skin_care/core/widgets/custom_drawer/components/custom_drawer_profile_info.dart';
import 'package:skin_care/core/widgets/custom_drawer/components/custom_drawer_sign_out_button.dart';
import 'package:skin_care/core/widgets/custom_drawer/components/custom_drawer_top_section.dart';

import '../../../ui/views/Admin/admin_main.dart';

class CustomDrawer extends BaseStatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      child:  SafeArea(
        child: Column(
          children: [
            CustomDrawerTopSection(),
            CustomDrawerProfileInfo(),
            Expanded(flex: 7, child: CustomDrawerPageList()),
            Expanded(flex: 3, child: CustomDrawerSignOutButton()),
            Expanded(flex: 1, child: SizedBox(
              height: 10,
              //button
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const AdminDashBoard());
                },
                child: const Text('Admin'),
              ),
            ),),

          ],
        ),
      ),
    );
  }
}
