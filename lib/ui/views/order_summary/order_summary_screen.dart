
import 'package:flutter/material.dart';

import 'package:skin_care/ui/views/order_summary/components/order_summary_app_bar.dart';
import 'package:skin_care/ui/views/order_summary/components/order_summary_body.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({Key? key}) : super(key: key);

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: OrderSummaryAppBar(),
      body: OrderSummaryBody(),
    );
  }
}
