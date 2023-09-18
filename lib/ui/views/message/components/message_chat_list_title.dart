
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/translations/translation_keys.dart';

class MessageChatListTitle extends StatelessWidget {
  const MessageChatListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: RichText(
        text: TextSpan(
          text: "${TranslationKeys.chatList.tr} ",
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: "(5)",
              style: context.textTheme.titleMedium?.copyWith(
                color: kLightBlueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
