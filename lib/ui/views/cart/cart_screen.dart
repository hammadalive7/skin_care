

import 'package:flutter/material.dart';

import 'package:skin_care/ui/views/cart/components/cart_app_bar.dart';
import 'package:skin_care/ui/views/cart/components/cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CartAppBar(),
      body: CartBody(),
    );
  }
}
