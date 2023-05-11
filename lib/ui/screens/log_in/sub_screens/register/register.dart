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
  bool _rememberMe = false;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordAgainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            const UpperPlaceHolder(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
              child: Column(
                children: [
                  CiftcidenTextField(
                      controller: phoneController,
                      icon: Icons.message_sharp,
                      text: "Telefon Numarası"),
                  CiftcidenTextField(
                      controller: emailController,
                      icon: Icons.message_sharp,
                      text: "Mail Adresi"),
                  CiftcidenTextField(
                      controller: addressController,
                      icon: Icons.message_sharp,
                      text: "İkamet Adresi"),
                  CiftcidenTextField(
                      controller: passwordController,
                      icon: Icons.message_sharp,
                      text: "Parola"),
                  CiftcidenTextField(
                      controller: passwordAgainController,
                      icon: Icons.message_sharp,
                      text: "Parola Doğrula"),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Login Butonuna Tıklanınca Yapılacak İşlemler
              },
              child: const Text('KAYDOL'),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/");
                  },
                  child: Text(
                    'Giriş Yap',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: _rememberMe
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      decorationColor: Colors.blue,
                      decorationThickness: 2,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/register");
                  },
                  child: Text(
                    'Giriş Yap',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: _rememberMe
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      decorationColor: Colors.blue,
                      decorationThickness: 2,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
