import 'package:flutter/material.dart';
import 'package:hackster/widgets/credit_insurance/credit_child.dart';

class Credit extends StatelessWidget {
  const Credit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
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
