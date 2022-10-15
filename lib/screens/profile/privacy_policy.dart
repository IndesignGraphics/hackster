import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Welcome to Farmer360. These terms and condition outline the rules and regulations for the use of Farmer360 Website And/or mobile application  by accessing that website and/or installing the app. We assume you accept these terms and Condition. Do not use Farmer360 if you do not agree to take all of the terms and conditions started on this page.The above terminology applies to these terms and Conditions.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
