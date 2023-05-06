import 'package:ciftciden/ui/common_widgets/atoms/custom_common_button.dart';
import 'package:flutter/material.dart';

import 'order_item.dart';

class CurrentOrdersScreen extends StatefulWidget {
  const CurrentOrdersScreen({Key? key}) : super(key: key);

  @override
  State<CurrentOrdersScreen> createState() => _CurrentOrdersScreenState();
}

class _CurrentOrdersScreenState extends State<CurrentOrdersScreen> {
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
        ],
      ),
    );
  }
}
