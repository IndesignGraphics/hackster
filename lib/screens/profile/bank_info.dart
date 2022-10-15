import 'dart:convert';

import 'package:flutter/material.dart';

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
        title: Text('Bank Info'),
      ),
      body: _isLoading ? Center(child: CircularProgressIndicator(),) : Container(
        padding: EdgeInsets.all(10),
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
                  const Text(
                    'Bank Name : ',
                    style: TextStyle(fontSize: 18),
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
            SizedBox(
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
                  const Text(
                    'Branch Name : ',
                    style: TextStyle(fontSize: 18),
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
            SizedBox(
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
                  const Text(
                    'Taluka : ',
                    style: TextStyle(fontSize: 18),
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
            SizedBox(
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
                  const Text(
                    'Account Number : ',
                    style: TextStyle(fontSize: 18),
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
            SizedBox(
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
                  const Text(
                    'IFSE code  : ',
                    style: TextStyle(fontSize: 18),
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
