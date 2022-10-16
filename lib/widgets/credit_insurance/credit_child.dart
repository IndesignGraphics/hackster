import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreditChild extends StatelessWidget {
  final creditData;
  const CreditChild({Key? key, required this.creditData}) : super(key: key);

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
            Text('${AppLocalizations.of(context)?.landName} : ${creditData['landTitle']}'),
            Text('${AppLocalizations.of(context)?.surveyNo} : 100'),
            Text('${AppLocalizations.of(context)?.totalArea} : 1-58-28'),
            Text('${AppLocalizations.of(context)?.totalCredit} : ${creditData['loanSize']} Rs'),
            Text('${AppLocalizations.of(context)?.bankName} : ${creditData['bankName']}'),
            Text('${AppLocalizations.of(context)?.accountNumber} : ${creditData['accountNumber']}'),
          ],
        ),
      ),
    );
  }
}
