import 'package:ciftciden/ui/common_widgets/atoms/custom_common_button.dart';
import 'package:ciftciden/ui/common_widgets/organisms/upper_place_holder_with_houses.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const UpperPlaceHolderWithHouses(),
          const Center(child: Text("Main Screen")),
          CustomCommonButton(text: "Siparis Ver", onPressed: () {})

        ],
      ),
    );
  }
}
