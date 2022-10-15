import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StandardSoilTest extends StatelessWidget {
  const StandardSoilTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.standardSoilTest ?? 'Standard Soil Test'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/standard_soil_test.png'),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)?.testIncludes ?? 'Test Includes',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '1. ${AppLocalizations.of(context)?.ph}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '2. ${AppLocalizations.of(context)?.organicCarbon}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
             Text(
              '3. ${AppLocalizations.of(context)?.potassium}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '4. ${AppLocalizations.of(context)?.phosphorus}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '5. ${AppLocalizations.of(context)?.electricalConductivity}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '6. ${AppLocalizations.of(context)?.nitrogen}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '7. ${AppLocalizations.of(context)?.calcium}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '8. ${AppLocalizations.of(context)?.magnesium}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '9. ${AppLocalizations.of(context)?.sulfur}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '10. ${AppLocalizations.of(context)?.zinc}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '11. ${AppLocalizations.of(context)?.manganese}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '12. ${AppLocalizations.of(context)?.iron}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '13. ${AppLocalizations.of(context)?.copper}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '14. ${AppLocalizations.of(context)?.boron}',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
