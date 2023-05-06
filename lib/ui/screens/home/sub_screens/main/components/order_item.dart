import 'package:ciftciden/ui/constants/paths.dart';
import 'package:ciftciden/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomOrderItem extends StatelessWidget {
  final int orderType;
  final String orderDate;
  final int orderAmount;
  final int isOrderCompleted;
  final List<Widget> orderItems = [
    const Text("Sipariş Onaylandı",
        style: TextStyle(color: CiftcidenColors.orderAccepted)),
    const Text(
      "Sipariş Onay Bekliyor",
      style: TextStyle(color: CiftcidenColors.orderWaitingResponse),
    ),
    const Text("Sipariş Reddedildi",
        style: TextStyle(color: CiftcidenColors.orderRejected)),
  ];

  CustomOrderItem(
      {Key? key,
      required this.orderType,
      required this.orderAmount,
      required this.orderDate,
      required this.isOrderCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: ListTile(
          leading: Image(
              height: 50.sp,
              width: 40.sp,
              image: AssetImage(orderType == 0
                  ? CiftcidenPaths.sutImage
                  : CiftcidenPaths.yogurtImage)),
          title:
              Text(orderType == 0 ? "$orderAmount Litre" : "$orderAmount Kg"),
          subtitle: Text(orderType == 0 ? "Süt" : "Yoğurt"),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(orderDate),
              orderItems[isOrderCompleted],
            ],
          )),
    );
  }
}
