
import 'package:flutter/material.dart';

import 'package:skin_care/ui/views/message/components/message_app_bar.dart';
import 'package:skin_care/ui/views/message/components/message_body.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Scaffold(
        appBar: MessageAppBar(),
        body: MessageBody(),
      ),
    );
  }
}
