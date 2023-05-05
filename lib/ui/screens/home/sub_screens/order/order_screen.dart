import 'package:ciftciden/ui/common_widgets/organisms/upper_place_holder_with_houses.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          UpperPlaceHolderWithHouses(),
          Center(child: Text("Order Screen")),
        ],
      ),
    );
  }
}
