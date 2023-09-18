
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/widgets/custom_text_field/custom_text_field.dart';

class ChatWriteMessageField extends StatelessWidget {
  const ChatWriteMessageField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: BaseController.messageController.messageEditController,
      hintText: TranslationKeys.writeReply.tr,
      onChanged: (val) => BaseController.messageController.writeMessage(val),
    );
  }
}
