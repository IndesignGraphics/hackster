import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreditChild extends StatelessWidget {
  const CreditChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${AppLocalizations.of(context)?.landName} : Shivji Land'),
            Text('${AppLocalizations.of(context)?.surveyNo} : 100'),
            Text('${AppLocalizations.of(context)?.totalArea} : 1-58-28'),
            Text('${AppLocalizations.of(context)?.totalCredit} : 2,00,000.00 Rs'),
            Text('${AppLocalizations.of(context)?.bankName} : State Bank of India'),
            Text('${AppLocalizations.of(context)?.accountNumber} : 12345678910'),
          ],
        ),
      ),
    );
  }
}
