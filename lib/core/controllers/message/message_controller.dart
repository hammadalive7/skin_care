

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';
import 'package:skin_care/core/data/message_list.dart';
import 'package:skin_care/core/models/message_model.dart';

class MessageController extends GetxController {
  final TextEditingController messageEditController = TextEditingController();
  final GroupedItemScrollController scrollController =
      GroupedItemScrollController();

  RxString message = "".obs;

  void writeMessage(String text) {
    message.value = text;
  }

  void sendMessage() {
    if (message.value.isEmpty) return;
    messageList.add(
      Message(text: message.value, timestamp: DateTime.now(), isSentByMe: true),
    );
    scrollController.jumpTo(
      index: 0,
    );
    reset();
  }

  void reset() {
    messageEditController.clear();
    message.value = "";
  }
}
