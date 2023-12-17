

import 'package:get/get.dart';

import 'package:skin_care/core/models/product_model.dart';

class CartItem {
  int id;
  RxInt piece;
  RxString image;
  RxString productName;
  RxDouble price;


  CartItem({
    required this.price,
    required this.image,
    required this.productName,
    required this.piece,
    required this.id,
  });
}
