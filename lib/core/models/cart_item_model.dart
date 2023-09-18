

import 'package:get/get.dart';

import 'package:skin_care/core/models/product_model.dart';

class CartItem {
  int? id;
  Product product;
  RxInt piece;

  CartItem({
    required this.product,
    required this.piece,
    this.id,
  });
}
