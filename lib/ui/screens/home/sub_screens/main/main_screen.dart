import 'package:ciftciden/ui/common_widgets/atoms/custom_common_button.dart';
import 'package:ciftciden/ui/common_widgets/organisms/upper_place_holder_with_houses.dart';
import 'package:ciftciden/ui/screens/home/sub_screens/main/components/current_orders.dart';
import 'package:ciftciden/ui/screens/home/sub_screens/main/components/previous_orders.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final Function({required int index, required int currentIndex}) onTabSelected;

  const MainScreen({Key? key, required this.onTabSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const UpperPlaceHolderWithHouses(),
            const TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text(
                      "Geçmiş Siparişler",
                    ),
                  ),
                  Tab(child: Text("Aktif Siparişler")),
                ]),
            const Expanded(
                flex: 5,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    PreviousOrdersScreen(),
                    CurrentOrdersScreen(),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CustomCommonButton(
                  text: "Sipariş Talebi Oluştur",
                  onPressed: () {
                    onTabSelected(index: 1, currentIndex: 2);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
