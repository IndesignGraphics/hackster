import 'package:flutter/material.dart';

class CreditChild extends StatelessWidget {
  const CreditChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Column(
          children: const [
            Text('Farm title : Shivji Land'),
            Text('Survey No. : 100'),
            Text('Total area : 1-58-28'),
            Text('Total Credit : 2,00,000.00 Rs'),
            Text('Bank Name : State Bank of India'),
            Text('Account Number : 12345678910'),
          ],
        ),
      ),
    );
  }
}
