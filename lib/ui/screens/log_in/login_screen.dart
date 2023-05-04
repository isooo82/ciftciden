import 'package:ciftciden/ui/common_widgets/atoms/ciftciden_text_field.dart';
import 'package:ciftciden/ui/common_widgets/organisms/upper_place_holder.dart';
import 'package:ciftciden/ui/constants/paths.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          child: Column(
            children: [
              const UpperPlaceHolder(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 5.h),
                child: Column(
                  children: [
                    const CiftcidenTextField(icon: Icons.phone_android, text: "Telefon Numaranızı Girin"),
                    const CiftcidenTextField(icon: Icons.lock, text: "Parolanızı girin"),

                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                        ),
                        const Text('Parolayı hatırla'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        // Forgot Password Tıklanınca Yapılacak İşlemler
                      },
                      child: const Text(
                        'Parolamı unuttum',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Login Butonuna Tıklanınca Yapılacak İşlemler
                      },
                      child: const Text('GİRİŞ YAP'),
                    ),
                  ],
                ),
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
      ),
    );
  }
}
