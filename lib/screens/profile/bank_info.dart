import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:http/http.dart' as http;

class BankInfo extends StatefulWidget {
  final String mobileNumber;

  const BankInfo(this.mobileNumber, {super.key});

  @override
  State<BankInfo> createState() => _BankInfoState();
}

class _BankInfoState extends State<BankInfo> {
  late var bankData;
  bool _isLoading = true;

  void loadBankData() async {
    final url =
        'https://hack-roso.onrender.com/getfarmer/${widget.mobileNumber}';
    final response = await http.get(Uri.parse(url));
    final fData = jsonDecode(response.body);
    setState(() {
      bankData = fData['bankInfo'];
      _isLoading = false;
    });
  }

  @override
  void initState() {
    loadBankData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bankDetails".tr),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                children: [
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
                          '${"bankName".tr} : ',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          bankData['bankName'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                          '${"branchName".tr} : ',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          bankData['branchName'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                          '${"taluko".tr} : ',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          bankData['taluka'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                          '${"accountNumber".tr} : ',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          bankData['accountNumber'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                          '${"ifscCode".tr}  : ',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          bankData['ifsc'],
                          style: const TextStyle(
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
    );
  }
}
