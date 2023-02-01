import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class WaterTest extends StatelessWidget {
  const WaterTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Test'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Text(
          'Apply For Water Test',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        onPressed: () {
          Get.snackbar(
            "Water Test",
            "Successfully Applied for Water Test",
            backgroundColor: const Color.fromARGB(75, 0, 0, 0),
            barBlur: 10,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        },
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
              "testIncludes".tr,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '1. ${"turbidity".tr}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '2. ${"temperature".tr}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '3. ${"ph".tr}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '4. ${"acidity".tr}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '5. ${"electricalConductivity".tr}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '6. ${"alkalinity".tr}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '7. ${"bacteria".tr}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '8. ${"viruses".tr}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '9. ${"chloride".tr}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '10. ${"dissolvedOxygen".tr}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '11. ${"hardness".tr}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '12. ${"bioChemicalOxygenDemand".tr}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '13. ${"chemicalOxygenDemand".tr}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '14. ${"radioactiveSubstances".tr}',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}