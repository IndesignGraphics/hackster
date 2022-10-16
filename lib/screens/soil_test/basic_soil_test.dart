import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BasicSoilTest extends StatelessWidget {
  const BasicSoilTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context)?.basicSoilTest ?? 'Basic Soil Test'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Text(
          'Apply For Basic Soil Test',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        onPressed: null,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/basic_soil_test.png'),
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
          ],
        ),
      ),
    );
  }
}
