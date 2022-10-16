import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackster/screens/other/add_new_crop.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CropHistory extends StatefulWidget {
  const CropHistory({Key? key}) : super(key: key);

  @override
  State<CropHistory> createState() => _CropHistoryState();
}

class _CropHistoryState extends State<CropHistory> {
  final _auth = FirebaseAuth.instance;
  bool _isLoading = true;
  var farmerCropHistory;

  void loadFarmerCropHistory() async {
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
      farmerCropHistory = farmerData['yeildInfo'];
      _isLoading = false;
    });
  }

  @override
  void initState() {
    loadFarmerCropHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context)?.cropHistory ?? 'Crop History'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(
                itemCount: farmerCropHistory.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Card(
                      color: Theme.of(context).primaryColorLight,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${AppLocalizations.of(context)?.landName} : ${farmerCropHistory[i]['landTitle']}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  '${AppLocalizations.of(context)?.year} : ${farmerCropHistory[i]['year']}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  '${AppLocalizations.of(context)?.cropType} : ${farmerCropHistory[i]['cropType']}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  '${AppLocalizations.of(context)?.cropName} : ${farmerCropHistory[i]['cropName']}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  '${AppLocalizations.of(context)?.quantity} : ${farmerCropHistory[i]['quintity']} Kg',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  '${AppLocalizations.of(context)?.totalPrice} : ${farmerCropHistory[i]['totalPrice']}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  '${AppLocalizations.of(context)?.harvestingTec} : ${farmerCropHistory[i]['harvestTech']}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Image.asset('assets/images/bill.png'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, i) {
                  return const SizedBox(
                    height: 5,
                  );
                },
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddNewCrop(),
            ),
          );
        },
        child: Text(AppLocalizations.of(context)?.addCrop ?? 'Add Crop'),
      ),
    );
  }
}
