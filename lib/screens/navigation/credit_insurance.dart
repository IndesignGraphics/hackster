import 'package:flutter/material.dart';
import 'package:hackster/widgets/credit_insurance/credit.dart';
import 'package:hackster/widgets/credit_insurance/insurance.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreditInsurance extends StatelessWidget {
  const CreditInsurance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)?.creditInsurance??'Credit/Insurance'),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(AppLocalizations.of(context)?.credit??'Credit'),
              ),
              Tab(
                child: Text(AppLocalizations.of(context)?.insurance??'Insurance'),
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
