import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/cart/components/cart_checkout_button.dart';
import 'package:skin_care/ui/views/cart/components/cart_order_list.dart';
import 'package:skin_care/ui/views/cart/components/cart_title.dart';
import 'package:skin_care/ui/views/cart/components/cart_total.dart';

import '../../../../core/models/cart_item_model.dart';
import '../../../../core/utils/base/base_controller.dart';

class CartBody extends StatefulWidget {
  const CartBody({
    super.key,
  });

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  late Stream<List<CartItem>> cartItemsStream;

  @override
  void initState() {
    super.initState();
    cartItemsStream = BaseController.cartController.getCartItemsStream();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceUtils.getHeight(context),
      child: StreamBuilder<List<CartItem>>(
          stream: cartItemsStream,
          builder: (context, AsyncSnapshot<List<CartItem>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final data = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SlideInLeft(
                        from: 10, child: CartTitle(cartCount: data!.length)),
                    Expanded(
                        child: SlideInRight(
                            from: 10,
                            child: CartCheckoutButton(cartItems: data.length))),
                  ],
                ),
                Expanded(
                    flex: 4,
                    child:
                        FadeInUp(from: 10, child: CartOrderList(data: data))),
                CartTotal(product: data),
                const Spacer(),
                // const Spacer(),
              ],
            );
          }),
    );
  }
}
