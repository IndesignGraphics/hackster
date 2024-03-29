import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class BasicSoilTest extends StatelessWidget {
  const BasicSoilTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "basicSoilTest".tr),
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
        onPressed: () {
          Get.snackbar(
            "Basic Soil Test",
            "Successfully Applied for Basic Soil Test",
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
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
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
          ],
        ),
      ),
    );
  }
}
