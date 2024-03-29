import 'package:flutter/material.dart';
import 'package:skin_care/core/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:skin_care/core/widgets/custom_app_bar/custom_app_bar_back_button.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  const ChatAppBar({
    required this.title,
    super.key,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: title,
      leading: const CustomAppBarBackButton(),
    );
  }
}
