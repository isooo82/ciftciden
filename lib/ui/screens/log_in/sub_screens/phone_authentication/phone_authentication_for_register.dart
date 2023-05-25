import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pinput.dart';

class VerifyPhoneScreenForRegister extends StatefulWidget {
  String phoneNumber;

  VerifyPhoneScreenForRegister({
    super.key,
    required this.phoneNumber,
    // required this.verificationId,
    // this.resendToken
  });

  @override
  _VerifyPhoneScreenForRegisterState createState() => _VerifyPhoneScreenForRegisterState();
}

class _VerifyPhoneScreenForRegisterState extends State<VerifyPhoneScreenForRegister> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  String verificationId = "";
  int resendToken = 0;
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sendCode();
  }
  //////////
  final pinController = TextEditingController();

  Future<void> _verifyCode() async {
    try {
      print("Verification ID: $verificationId");
      print("ResendToken: $resendToken");
      print("Code: ${pinController.text.trim()}");

      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: pinController.text.trim(),
      );
      var result = await auth.signInWithCredential(credential);

      if (result.user != null) {
        print("NAVIGATING TO MAIN SCREEN");
        print(result.user!.uid);
        if (!mounted) return;
        // return "tamam";
        Navigator.of(context).pop(true);
      } else {
        if(!mounted) return;
        Navigator.of(context).pop(false);
      }
      // TODO: Navigate to the next screen after successful verification
    } catch (e) {
      Navigator.of(context).pop(false);
      // return "Pin uyumsuz";
      print('Failed to verify phone number: $e');
      // TODO: Handle verification failure (e.g. show an error message)
    }
  }

  Future<void> _sendCode() async {
    print("Sending the code");
    try {
      verificationCompleted(PhoneAuthCredential credential) async {
        print("VERIFIXATION is COMPLETED");
        await auth.signInWithCredential(credential);
        // TODO: Navigate to the next screen after successful verification
        if(credential.smsCode != null) {
          pinController.setText(credential.smsCode!);
        }
      }

      verificationFailed(FirebaseAuthException authException) {
        print('Failed to verify phone number: ${authException.message}');
        // TODO: Handle verification failure (e.g. show an error message)
      }

      codeSent(String verification, [int? resend]) async {
        setState(() {
          verificationId = verification;
          resendToken = resend!;
        });
      }

      codeAutoRetrievalTimeout(String verification) {
        setState(() {
          verificationId = verification;
        });
      }

      await auth.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        timeout: const Duration(seconds: 60),
        forceResendingToken: resendToken,
      );
    } catch (e) {
      showSnackBar(text: "Pin Uyumsuz");
      print('Failed to resend verification code: $e');
      // TODO: Handle resend failure (e.g. show an error message)
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Telefonunuzu Onaylayın'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("${widget.phoneNumber} numaralı telefona gönderilen kodu giriniz.", style: TextStyle(fontSize: 20),),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                  controller: pinController,
                  keyboardType: TextInputType.number,
                  validator: (s) {
                    _verifyCode();

                    // return s == '222222' ? null : 'Pin is incorrect';
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                )
                ),
          ],
        ),
      ),
    );
  }

  showSnackBar({required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
