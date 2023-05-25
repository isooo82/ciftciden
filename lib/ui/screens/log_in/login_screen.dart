import 'package:ciftciden/cubit/user/user_cubit.dart';
import 'package:ciftciden/ui/common_widgets/atoms/ciftciden_text_field.dart';
import 'package:ciftciden/ui/common_widgets/atoms/custom_blue_button.dart';
import 'package:ciftciden/ui/common_widgets/molecules/custom_snack_bar.dart';
import 'package:ciftciden/ui/common_widgets/organisms/upper_place_holder.dart';
import 'package:ciftciden/ui/constants/paths.dart';
import 'package:ciftciden/ui/screens/log_in/sub_screens/phone_authentication/phone_authentication.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneController.addListener(() {
      String text = phoneController.text;
      text = text.replaceAll(RegExp(r"[.,+()N*/#; -]"), "");

      print(text.length);
      if (text.length > 10) {
        print("inside");
        text = text.substring(0, 10);
        print(text);
      }
      print(text);
      // if (text.length == 3) {
      //   text = text + " ";
      // } else if (text.length == 7) {
      //   text = text + " ";
      // }

      phoneController.value = phoneController.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  // final TextEditingController passwordController = TextEditingController();

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
                          text: "Telefon Numaranızı Girin",
                          textInputType: TextInputType.phone,
                          prefixText: '+90',
                        ),
                        // CiftcidenTextField(
                        //     controller: passwordController,
                        //     icon: Icons.lock,
                        //     text: "Parolanızı girin"),
                        const SizedBox(height: 10),
                        // Row(
                        //   children: [
                        //     Checkbox(
                        //       value: _rememberMe,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           _rememberMe = value!;
                        //         });
                        //       },
                        //     ),
                        //     const Text('Parolayı hatırla'),
                        //   ],
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //     // Forgot Password Tıklanınca Yapılacak İşlemler
                        //   },
                        //   child: const Text(
                        //     'Parolamı unuttum',
                        //     style: TextStyle(
                        //       color: Colors.blue,
                        //       decoration: TextDecoration.underline,
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 4.h),
                        CustomBlueButton(
                            text: 'Giriş Yap',
                            onPressed: () async {
                              final String userPhone =
                                  "+90${phoneController.text.replaceAll(" ", " ")}";
                              print(userPhone);
                              // return;
                              // final String userPassword =
                              //     passwordController.text;
                              // context.read<UserCubit>().loginUser(userPhone: userPhone, password: userPassword);
                              final bool userExists = await context.read<UserCubit>().verifyUserExistsWithPhone(phone: userPhone);
                              if(userExists) {
                                if(!mounted) return;
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      VerifyPhoneScreen(phoneNumber: userPhone),
                                ));
                              } else {
                                showSnackBar(text: "Bu numara ile kayıtlı kullanıcı bulunamadı! Lütfen Kayıt Olun");
                              }

                              // return;
                              // Navigator.of(context)
                              //     .pushReplacementNamed("/home");
                              // return;
                              // final String userPhone = phoneController.text;
                              // final String userPassword =
                              //     passwordController.text;
                              // if (userPassword.isEmpty | userPhone.isEmpty) {
                              //   print("Hatali, doldur");
                              //   showSnackBar(text: "Lütfen tüm alanları doldurunuz!");
                              // } else {
                              //   final bool userExist = await context
                              //       .read<UserCubit>()
                              //       .loginUser(
                              //           userPhone: userPhone,
                              //           password: userPassword);
                              //   if (userExist) {
                              //     if(!mounted) return;
                              //     Navigator.of(context)
                              //         .pushReplacementNamed("/home");
                              //   } else {
                              //     showSnackBar(text: "Kullanıcı bulunamadı");
                              //     print("No user");
                              //   }
                              // }
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
                      onPressed: null,
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
                        'Kayıt Ol',
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

  showSnackBar({required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
