import 'package:ciftciden/ui/common_widgets/organisms/upper_place_holder_with_houses.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          UpperPlaceHolderWithHouses(),
          Center(child: Text("Profile Screen")),
        ],
      ),
    );
  }
}
