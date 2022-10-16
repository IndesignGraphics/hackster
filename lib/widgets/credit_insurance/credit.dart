import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackster/widgets/credit_insurance/credit_child.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Credit extends StatefulWidget {
  const Credit({Key? key}) : super(key: key);

  @override
  State<Credit> createState() => _CreditState();
}

class _CreditState extends State<Credit> {
  final _auth = FirebaseAuth.instance;
  bool _isLoading = true;
  var farmerCreditData;

  void loadFarmerCreditData() async {
    final prefs = await SharedPreferences.getInstance();
    final currentUser = _auth.currentUser!;
    final userId = currentUser.uid;
    String? encodedData = prefs.getString(userId);
    final decodedData = jsonDecode(encodedData!);
    String mobileNum = decodedData['mobileNo'];
    final url = "https://hack-roso.onrender.com/getfarmer/$mobileNum";
    final response = await http.get(Uri.parse(url));
    final farmerData = jsonDecode(response.body);
    setState(() {
      farmerCreditData = farmerData['creditinfo'];
      _isLoading = false;
    });
    // print(farmerCreditData);
  }

  @override
  void initState() {
    loadFarmerCreditData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height - 130,
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: farmerCreditData.length,
                itemBuilder: (context, i) {
                  return CreditChild(
                    creditData: farmerCreditData[i],
                  );
                },
              ),
            ),
    );
  }
}
