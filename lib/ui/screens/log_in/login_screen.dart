import 'package:ciftciden/cubit/user/user_cubit.dart';
import 'package:ciftciden/ui/common_widgets/atoms/ciftciden_text_field.dart';
import 'package:ciftciden/ui/common_widgets/atoms/custom_blue_button.dart';
import 'package:ciftciden/ui/common_widgets/organisms/upper_place_holder.dart';
import 'package:ciftciden/ui/constants/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  bool _rememberMe = false;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const UpperPlaceHolder(),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 4.h),
                    child: Column(
                      children: [
                        CiftcidenTextField(
                            controller: phoneController,
                            icon: Icons.phone_android,
                            text: "Telefon Numaranızı Girin"),
                        CiftcidenTextField(
                            controller: passwordController,
                            icon: Icons.lock,
                            text: "Parolanızı girin"),
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
                        SizedBox(height: 4.h),
                        CustomBlueButton(
                            text: 'Giriş Yap',
                            onPressed: () async {
                              final String userPhone = phoneController.text;
                              final String userPassword = passwordController
                                  .text;

                              if(userPassword.isEmpty | userPhone.isEmpty){
                                print("Hatali, doldur");
                              } else {
                                final bool userExist = await context.read<UserCubit>().loginUser(
                                    userPhone: userPhone, password: userPassword);
                                if(userExist){

                                  Navigator.of(context)
                                      .pushReplacementNamed("/home");
                                } else {
                                  print("No user");
                                }
                                }

                            }),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     // Login Butonuna Tıklanınca Yapılacak İşlemler
                        //     Navigator.of(context).pushReplacementNamed("/home");
                        //   },
                        //   child: const Text('GİRİŞ YAP'),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
