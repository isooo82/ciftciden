import 'package:ciftciden/ui/common_widgets/atoms/profile_text_field.dart';
import 'package:ciftciden/ui/common_widgets/organisms/upper_place_holder_with_houses.dart';
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
    first.text = "semih";
    second.text = "semih";
    third.text = "semih";
    fourth.text = "semih";
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UpperPlaceHolderWithHouses(),
          TextButton(onPressed: () {
            setState(() {
              first.text = "erdogan";
            });
          }, child: Text("Gonder")),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                ProfileTextField(
                    textEditingController: first,
                    text: "Adınız",
                    icon: Icons.add_alert,
                    setting_icon: Icons.settings),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Adınız',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Soyadınız',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'E-posta',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Şifre',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
