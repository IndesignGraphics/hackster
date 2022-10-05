import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController farmerIdController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    child: Icon(Icons.account_circle, size: 100),
                    radius: 80,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Text("Mobile No./Farmer ID"),
                      SizedBox(height: 10),
                      TextField(
                        controller: farmerIdController,
                        decoration: const InputDecoration(
                            labelText: "Enter Mobile No./Farmer ID"),
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text("Send OTP"),
                        ),
                      ),
                      SizedBox(height: 5),
                      // Text("Enter OTP"),
                      SizedBox(height: 10),
                      TextField(
                        controller: farmerIdController,
                        decoration:
                            const InputDecoration(labelText: "Enter OTP"),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () {}, child: Text("Verify OTP")),
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
