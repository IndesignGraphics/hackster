import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.privacyPolicy ?? 'Privacy Policy'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)?.tAC ?? 'Terms and Conditions',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppLocalizations.of(context)?.termsAndCondition ?? 'Welcome to Farmer360. These terms and condition outline the rules and regulations for the use of Farmer360 Website And/or mobile application  by accessing that website and/or installing the app. We assume you accept these terms and Condition. Do not use Farmer360 if you do not agree to take all of the terms and conditions started on this page.The above terminology applies to these terms and Conditions.',
                textAlign: TextAlign.center,
                style: const TextStyle(
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
