
import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/chat/components/chat_bottom_bar.dart';
import 'package:skin_care/ui/views/chat/components/chat_list.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceUtils.getHeight(context),
      child: const Column(
        children: [
          Expanded(child: ChatList()),
          ChatBottomBar(),
        ],
      ),
    );
  }
}
