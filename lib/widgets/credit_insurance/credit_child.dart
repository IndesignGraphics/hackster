import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            Text('${"landName".tr} : ${creditData['landTitle']}'),
            Text('${"surveyNo".tr} : 100'),
            Text('${"totalArea".tr} : 1-58-28'),
            Text('${"totalCredit".tr} : ${creditData['loanSize']} Rs'),
            Text('${"bankName".tr} : ${creditData['bankName']}'),
            Text('${"accountNumber".tr} : ${creditData['accountNumber']}'),
          ],
        ),
      ),
    );
  }
}
