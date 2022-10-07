import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hackster/screens/main_screen.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController farmerIdController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isCodeSent = false;
  final _formKey = GlobalKey<FormState>();
  final _otpFormKey = GlobalKey<FormState>();
  late String mVerificationId, number;
  late User _currentUser;
  late String _userId;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  bool _isLoading = false;
  bool _isLoad = false;

  void verifyNumber(BuildContext context) async {
    number = farmerIdController.text;
    _auth.verifyPhoneNumber(
      phoneNumber: '+91$number',
      verificationCompleted: (PhoneAuthCredential credential) async {
        // await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The provided phone number is not valid.'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Something went wrong, try later!'),
            ),
          );
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        setState(() {
          _isCodeSent = true;
          _isLoading = false;
        });
        mVerificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void sendOtp(BuildContext context) async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    verifyNumber(context);
  }

  void verifyOtp(BuildContext context) async {
    final isValid = _otpFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: mVerificationId, smsCode: otpController.text);
    await _auth.signInWithCredential(credential);
    _currentUser = _auth.currentUser!;
    _userId = _currentUser.uid;
    final ref = _database.ref('users').child(_userId);
    await ref.set({
      'mobileNumber': number,
    });
    if (!mounted) {
      return;
    }
    setState(() {
      _isLoad = false;
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 80,
                    child: Icon(Icons.account_circle, size: 100),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
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
                      const SizedBox(height: 20),
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
                            labelText: "Enter Mobile No.",
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _isLoading=true;
                            });
                            sendOtp(context);
                          },
                          child: const Text("Send OTP"),
                        ),
                      ),
                      if(_isLoading)
                        const CircularProgressIndicator(),
                      const SizedBox(height: 10),
                      if (_isCodeSent)
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
                            decoration:
                                const InputDecoration(labelText: "Enter OTP"),
                          ),
                        ),
                      const SizedBox(height: 10),
                      if (_isCodeSent)
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isLoad = true;
                            });
                            verifyOtp(context);
                          },
                          child: const Text("Verify OTP"),
                        ),
                      if(_isLoad)
                        const CircularProgressIndicator(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
