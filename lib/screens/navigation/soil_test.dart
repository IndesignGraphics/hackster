import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackster/screens/soil_test/basic_soil_test.dart';
import 'package:hackster/screens/soil_test/water_test.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../soil_test/standard_soil_test.dart';

class SoilTest extends StatelessWidget {
  const SoilTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 20;
    return Scaffold(
      appBar: AppBar(
        title: Text("soilTest".tr),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        height: (width / 3) ,
                        width: (width / 3) - 10,
                        color: Theme.of(context).primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/basic_soil_test.png',
                              fit: BoxFit.cover,
                              height: (width / 3) - 40,
                              width: (width / 3) - 10,
                            ),
                            Text(
                              "basicSoilTest".tr,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const BasicSoilTest(),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        height: (width / 3),
                        width: (width / 3) - 10,
                        color: Theme.of(context).primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/standard_soil_test.png',
                              fit: BoxFit.cover,
                              height: (width / 3) - 40,
                              width: (width / 3) - 10,
                            ),
                            Text(
                              "standardSoilTest".tr,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const StandardSoilTest(),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        height: (width / 3),
                        width: (width / 3) - 10,
                        color: Theme.of(context).primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/water_test.png',
                              fit: BoxFit.cover,
                              height: (width / 3) - 40,
                              width: (width / 3) - 10,
                            ),
                            Text(
                              "waterTest".tr,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const WaterTest(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "soilTestReports".tr,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          color: Theme.of(context).primaryColorLight),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "basicSoilTest".tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: const [
                              Text(
                                'Shivji Land',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '23 July 2022',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          color: Theme.of(context).primaryColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "soilSampleAnalysis".tr,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '1. ${"ph".tr} : 5.4',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '2. ${"organicCarbon".tr} : 120',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '3. ${"potassium".tr} : 22',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '4. ${"phosphorus".tr} : 23',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '5. ${"electricalConductivity".tr} : 30%',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '6. ${"nitrogen".tr} : 120-200',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          color: Theme.of(context).primaryColorLight),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "basicSoilTest".tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: const [
                              Text(
                                'Shivji Land',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '23 July 2022',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          color: Theme.of(context).primaryColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "soilSampleAnalysis".tr,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '1. ${"ph".tr} : 5.4',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '2. ${"organicCarbon".tr} : 120',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '3. ${"potassium".tr} : 22',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '4. ${"phosphorus".tr} : 23',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '5. ${"electricalConductivity".tr} : 30%',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '6. ${"nitrogen".tr} : 120-200',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
