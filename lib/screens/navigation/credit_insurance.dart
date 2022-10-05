import 'package:flutter/material.dart';
import 'package:hackster/widgets/credit_insurance/credit.dart';
import 'package:hackster/widgets/credit_insurance/insurance.dart';

class CreditInsurance extends StatelessWidget {
  const CreditInsurance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Credit/Insurance'),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text('Credit'),
              ),
              Tab(
                child: Text('Insurance'),
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Credit(),
            Insurance(),
          ],
        ),
      ),
    );
  }
}
