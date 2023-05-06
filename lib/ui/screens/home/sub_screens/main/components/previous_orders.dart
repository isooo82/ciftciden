import 'package:ciftciden/ui/common_widgets/atoms/custom_common_button.dart';
import 'package:flutter/material.dart';

import 'order_item.dart';

class PreviousOrdersScreen extends StatefulWidget {
  const PreviousOrdersScreen({Key? key}) : super(key: key);

  @override
  State<PreviousOrdersScreen> createState() => _PreviousOrdersScreenState();
}

class _PreviousOrdersScreenState extends State<PreviousOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomOrderItem(
              orderType: 0,
              isOrderCompleted: 1,
              orderAmount: 12,
              orderDate: "15.01.2023"),
          CustomOrderItem(
              orderType: 1,
              isOrderCompleted: 0,
              orderAmount: 15,
              orderDate: "15.01.2023"),
          CustomOrderItem(
              orderType: 1,
              isOrderCompleted: 2,
              orderAmount: 15,
              orderDate: "15.01.2023"),
          CustomOrderItem(
              orderType: 1,
              isOrderCompleted: 2,
              orderAmount: 15,
              orderDate: "15.01.2023"),
          CustomOrderItem(
              orderType: 1,
              isOrderCompleted: 2,
              orderAmount: 15,
              orderDate: "15.01.2023"),
        ],
      ),
    );
  }
}
