

import 'package:get/get.dart';

import 'package:skin_care/core/models/message_model.dart';

RxList<Message> messageList = [
  Message(
    text:
        "Hello! We have noticed that there are some items left in your cart. Complete your order now.",
    url: "https://nike/shoe-shoe-suhduisf-distro-style-man-i.6983157.3985",
    image: "assets/image/profile_picture.png",
    timestamp: DateTime(2023, 1, 1, 0, 0, 0),
    isSentByMe: false,
  ),
  Message(
    text: "I've been dealing with acne for a while, and regular products haven\'t helped. I\'d like your advice on how to treat it and improve my skin!",
    timestamp: DateTime(2023, 1, 1, 0, 1, 1),
    isSentByMe: true,
  ),
].obs;
