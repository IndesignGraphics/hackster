import 'package:flutter/material.dart';
import 'package:hackster/widgets/credit_insurance/credit_child.dart';

class Credit extends StatelessWidget {
  const Credit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, i) {
              return const CreditChild();
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: (){},
        child: const Text('Apply for new credit'),
      ),
    );
  }
}
