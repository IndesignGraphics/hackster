import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController feedbackController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.helpAndSupport ?? 'Help and Support'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)?.helloFarmer??'Hello farmer,\nFarmer360 is ready get your feedback. Please give your feedback to use and help use to improve our application.',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: feedbackController,
                decoration: InputDecoration(
                  label: Text(AppLocalizations.of(context)?.enterYourFeedback ?? 'Enter Your Feedback'),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Feedback Submitted')));
          feedbackController.clear();
        },
        child: Text(AppLocalizations.of(context)?.submit ?? 'Submit'),
      ),
    );
  }
}
