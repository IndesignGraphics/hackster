import 'package:flutter/material.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _feedbackController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Help and Support'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: _feedbackController,
                decoration: InputDecoration(
                  label: Text('Enter Your Feedback'),
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
              .showSnackBar(SnackBar(content: Text('Feedback Submitted')));
          _feedbackController.clear();
        },
        child: const Text('Submit'),
      ),
    );
  }
}
