import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyPhoneScreen extends StatefulWidget {

  String phoneNumber;

  VerifyPhoneScreen(
      {super.key,
      required this.phoneNumber,
      // required this.verificationId,
      // this.resendToken
      });

  @override
  _VerifyPhoneScreenState createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  String verificationId = "";
  int resendToken = 0;
  final auth = FirebaseAuth.instance;

  Future<void> _verifyCode() async {
    try {
      print("Verification ID: $verificationId");
      print("ResendToken: $resendToken");
      print("Code: ${_codeController.text.trim()}");

      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: _codeController.text.trim(),
      );
      var result = await auth.signInWithCredential(credential);

      if(result.user != null){
        print("NAVIGATING TO MAIN SCREEN");
        print(result.user!.uid);
        if(!mounted) return;
        Navigator.of(context).pop();
      }
      // TODO: Navigate to the next screen after successful verification
    } catch (e) {
      print('Failed to verify phone number: $e');
      // TODO: Handle verification failure (e.g. show an error message)
    }
  }

  Future<void> _resendCode() async {
    try {
      verificationCompleted(AuthCredential credential) async {
        await auth.signInWithCredential(credential);
        // TODO: Navigate to the next screen after successful verification
      }

      verificationFailed(FirebaseAuthException authException) {
        print('Failed to verify phone number: ${authException.message}');
        // TODO: Handle verification failure (e.g. show an error message)
      }

      codeSent(String verificationId, [int? resendToken]) async {
        setState(() {
          verificationId = verificationId;
          resendToken = resendToken;
        });
      }

      codeAutoRetrievalTimeout(String verificationId) {
        setState(() {
          verificationId = verificationId;
        });
      }

      // await auth.verifyPhoneNumber(
      //   phoneNumber: widget.phoneNumber,
      //   verificationCompleted: verificationCompleted,
      //   verificationFailed: verificationFailed,
      //   codeSent: codeSent,
      //   codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      //   timeout: const Duration(seconds: 60),
      //   forceResendingToken: resendToken,
      // );
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+90 5551432027',
        verificationCompleted: (PhoneAuthCredential credential) {
          print("VERIFICATION COMPLETED: $credential");
        },
        verificationFailed: (FirebaseAuthException e) {
          print("VERIFICATION FAILED");
          print("Error: ${e.message}");
        },
        codeSent: (String verification, int? resend) {
          print("CODE SENT");
          print("Verification id: $verification");
          print("resendToken: $resend");
          setState(() {
            verificationId = verification;
            resendToken = resend!;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      // TODO: Show a success message after the code is sent
    } catch (e) {
      print('Failed to resend verification code: $e');
      // TODO: Handle resend failure (e.g. show an error message)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Phone Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Please enter the verification code sent to ${widget.phoneNumber}:',
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _codeController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: const InputDecoration(
                  hintText: 'Enter code',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter verification code';
                  } else if (value.length != 6) {
                    return 'Verification code should be 6 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  const Text(
                    'Didn\'t receive the code?',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  TextButton(
                    child: const Text(
                      'Resend',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    onPressed: () => _resendCode(),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                child: const Text('Verify'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _verifyCode();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
