import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileInfo extends StatelessWidget {
  final farmerData;
  final String farmerName;
  const ProfileInfo({Key? key, this.farmerData, required this.farmerName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(farmerName),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height - 110,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child:Row(
                  children: [
                    Text(
                      '${"farmerID".tr} : ',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      farmerData['farmId'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Row(
                  children: [
                    Text(
                      '${"farmerName".tr} : ',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      farmerName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Row(
                  children: [
                    Text(
                      '${"aadharNumber".tr} : ',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      farmerData['perinfo']['adhar'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Row(
                  children: [
                    Text(
                      '${"emailID".tr} : ',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      farmerData['comminfo']['email'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Row(
                  children: [
                    Text(
                      '${"mobileNumber".tr} : ',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      farmerData['comminfo']['mobileNumber'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Row(
                  children: [
                    Text(
                      '${"gender".tr} : ',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      farmerData['perinfo']['gender'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Row(
                  children: [
                    Text(
                      '${"dateOfBirth".tr} : ',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      farmerData['perinfo']['dob'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.all(10),
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     // color: Colors.greenAccent,
              //     borderRadius: BorderRadius.circular(10),
              //     border: Border.all(color: Colors.green),
              //   ),
              //   child: Row(
              //     children: [
              //       Text(
              //         '${AppLocalizations.of(context)?.pincode} : ',
              //         style: const TextStyle(fontSize: 18),
              //       ),
              //       Text(
              //         farmerData['perinfo']['pincode'],
              //         style: const TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Row(
                  children: [
                    Text(
                      '${"district".tr} : ',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      farmerData['perinfo']['district'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Row(
                  children:[
                    Text(
                      '${"taluko".tr} : ',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      farmerData['perinfo']['taluko'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Row(
                  children: [
                    Text(
                      '${"address".tr} : ',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      farmerData['perinfo']['homeAddrs'],
                      style:  const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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
