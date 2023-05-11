import 'package:ciftciden/ui/common_widgets/atoms/profile_text_field.dart';
import 'package:ciftciden/ui/common_widgets/organisms/upper_place_holder_with_houses.dart';
import 'package:ciftciden/ui/constants/paths.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController first = TextEditingController();
  final TextEditingController second = TextEditingController();
  final TextEditingController third = TextEditingController();
  final TextEditingController fourth = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setTheUserInfo();
  }

  setTheUserInfo() {
    first.text = "";
    second.text = "";
    third.text = "";
    fourth.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UpperPlaceHolderWithHouses(),
          TextButton(
              onPressed: () {
                setState(() {
                  first.text = "erdogan";
                });
              },
              child: Text("Gonder")),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                ProfileTextField(
                  textEditingController: first,
                  text: "Adınız",
                  iconPath: CiftcidenPaths.personSvgPath,
                ),
                SizedBox(height: 10),
                ProfileTextField(
                  textEditingController: second,
                  text: "Soyadınız",
                  // icon: SvgPicture.asset(
                  //   'assets/icons/phone.svg',
                  //   width: 24,
                  //   height: 24,
                  iconPath: CiftcidenPaths.phoneSvgPath,
                ),
                SizedBox(height: 10),
                ProfileTextField(
                  textEditingController: third,
                  text: "Telefon Numaranız",
                  iconPath: CiftcidenPaths.emailSvgPath,
                ),
                SizedBox(height: 10),
                ProfileTextField(
                  textEditingController: fourth,
                  text: "Adresiniz",
                  iconPath: CiftcidenPaths.locationSvgPath,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
