import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController feedbackController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("helpAndSupport".tr),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "helloFarmer".tr,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: feedbackController,
                decoration: InputDecoration(
                  label: Text("enterYourFeedback".tr),
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
        child: Text("submit".tr),
      ),
    );
  }
}
