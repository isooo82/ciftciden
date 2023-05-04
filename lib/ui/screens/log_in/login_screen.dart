import 'package:ciftciden/ui/common_widgets/atoms/ciftciden_text_field.dart';
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
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Image.asset(CiftcidenPaths.ciftcidenLogo),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Image.asset(CiftcidenPaths.sutKovasi, width: 15.w, height: 10.h),
                        ),
                        const Text(
                          'ÇİFTÇİDEN',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 45,
                            fontWeight: FontWeight.w400,
                            height: 1.15,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
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
