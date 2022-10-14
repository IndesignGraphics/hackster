import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:hackster/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController farmerIdController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _otpFormKey = GlobalKey<FormState>();
  late String number, mVerificationId, userId;
  bool _isCodeSent = false, _isLoading = false;
  late User currentUser;

  void sendOtp() async {
    setState(() {
      _isLoading = true;
    });
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      setState(() {
        _isLoading = false;
      });
      return;
    }
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91$number",
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          _isLoading = false;
        });
        print(e);
      },
      codeSent: (String verificationId, int? resendToken) {
        mVerificationId = verificationId;
        setState(() {
          _isLoading = false;
          _isCodeSent = true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOtp(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    final isValid = _otpFormKey.currentState!.validate();
    if (!isValid) {
      setState(() {
        _isLoading = false;
      });
      return;
    }
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: mVerificationId, smsCode: otpController.text);
    await _auth.signInWithCredential(credential);
    currentUser = _auth.currentUser!;
    userId = currentUser.uid;
    final farmerIDUrl =
        'https://hack-roso.onrender.com/getfarmer/$number';
    final response = await http.get(Uri.parse(farmerIDUrl),);
    final farmerData = jsonDecode(response.body);
    final prefs = await SharedPreferences.getInstance();
    final data = {
      "id":userId,
      "farmerId":farmerData['farmId'],
      "mobileNo":number
    };
    String encodedData = jsonEncode(data);
    await prefs.setString(userId, encodedData);
    if(!mounted){
      return;
    }
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
    );
  }
  //
  // void printData() async {
  //   const farmerIDUrl =
  //       'https://hack-roso.onrender.com/getfarmer/8155977453';
  //   final response = await http.get(Uri.parse(farmerIDUrl),);
  //   final farmerData = jsonDecode(response.body);
  //   print(farmerData['farmId']);
  // }

  // @override
  // void initState() {
  //   printData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 80,
                    child: Icon(Icons.account_circle, size: 100),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                if (_isLoading) const CircularProgressIndicator(),
                if (!_isLoading)
                  _isCodeSent
                      ? Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Form(
                                key: _otpFormKey,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter otp';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: otpController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Enter OTP",
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  verifyOtp(context);
                                },
                                child: const Text("Verify OTP"),
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Form(
                                key: _formKey,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter mobile number';
                                    }
                                    if (value.length != 10) {
                                      return 'Please enter valid mobile number';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: farmerIdController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Enter Mobile No.",
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Align(
                                alignment: Alignment.topRight,
                                child: TextButton(
                                  onPressed: () {
                                    number = farmerIdController.text;
                                    sendOtp();
                                  },
                                  child: const Text("Send OTP"),
                                ),
                              ),
                            ],
                          ),
                        ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
