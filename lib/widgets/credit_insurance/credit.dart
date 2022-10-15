import 'package:flutter/material.dart';
import 'package:hackster/widgets/credit_insurance/credit_child.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Credit extends StatelessWidget {
  const Credit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height-130,
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, i) {
              return const CreditChild();
            },
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: ElevatedButton(
      //   onPressed: (){},
      //   child: Text(AppLocalizations.of(context)?.applyForNewCredit??'Apply for new credit'),
      // ),
    );
  }
}
