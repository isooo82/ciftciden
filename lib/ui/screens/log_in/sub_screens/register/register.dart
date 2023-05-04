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
                children: const [
                  CiftcidenTextField(
                      icon: Icons.message_sharp, text: "Telefon Numarası"),
                  CiftcidenTextField(
                      icon: Icons.message_sharp, text: "Mail Adresi"),
                  CiftcidenTextField(
                      icon: Icons.message_sharp, text: "İkamet Adresi"),
                  CiftcidenTextField(icon: Icons.message_sharp, text: "Parola"),
                  CiftcidenTextField(
                      icon: Icons.message_sharp, text: "Parola Doğrula"),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Login Butonuna Tıklanınca Yapılacak İşlemler
              },
              child: const Text('KAYDOL'),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TabBar(
                          indicatorColor: Colors.blue,
                          labelColor: Colors.blue,
                          onTap: (int page) {
                            if (page == 0) {
                              Navigator.pushReplacementNamed(context, "/");
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, "/register");
                            }
                          },
                          /*  underLineColor: Colors.grey,*/
                          tabs: [
                            Tab(
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
                            Tab(
                              child: Text(
                                'Kaydol',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  decoration: !_rememberMe
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
