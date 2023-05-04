import 'package:ciftciden/ui/common_widgets/atoms/ciftciden_text_field.dart';
import 'package:ciftciden/ui/common_widgets/organisms/upper_place_holder.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:
        Column(
          children: [
            const UpperPlaceHolder(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
              child: Column(
                children: const [
                  CiftcidenTextField(icon: Icons.message_sharp, text: "Telefon Numarası"),
                  CiftcidenTextField(icon: Icons.message_sharp, text: "Mail Adresi"),
                  CiftcidenTextField(icon: Icons.message_sharp, text: "İkamet Adresi"),
                  CiftcidenTextField(icon: Icons.message_sharp, text: "Parola"),
                  CiftcidenTextField(icon: Icons.message_sharp, text: "Parola Doğrula"),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Login Butonuna Tıklanınca Yapılacak İşlemler
              },
              child: const Text('KAYDOL'),
            ),
          ],
        ),
      ),
    );
  }
}
