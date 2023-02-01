import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class StandardSoilTest extends StatelessWidget {
  const StandardSoilTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("standardSoilTest".tr),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Text(
          'Apply For Standard Soil Test',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        onPressed: () {
          Get.snackbar(
            "Standard Soil Test",
            "Successfully Applied for Standard Soil Test",
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
            Image.asset('assets/images/standard_soil_test.png'),
            const SizedBox(
              height: 10,
            ),
            Text(
              "testIncludes".tr,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '1. ${"ph".tr}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '2. ${"organicCarbon".tr}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
             Text(
              '3. ${"potassium".tr}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '4. ${"phosphorus".tr}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '5. ${"electricalConductivity".tr}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '6. ${"nitrogen".tr}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '7. ${"calcium".tr}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '8. ${"magnesium".tr}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '9. ${"sulfur".tr}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '10. ${"zinc".tr}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '11. ${"manganese".tr}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '12. ${"iron".tr}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '13. ${"copper".tr}',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '14. ${"boron".tr}',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
