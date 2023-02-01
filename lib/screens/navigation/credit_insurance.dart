import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackster/widgets/credit_insurance/credit.dart';
import 'package:hackster/widgets/credit_insurance/insurance.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreditInsurance extends StatelessWidget {
  const CreditInsurance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("creditInsurance".tr),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text("credit".tr),
              ),
              Tab(
                child: Text("insurance".tr),
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
