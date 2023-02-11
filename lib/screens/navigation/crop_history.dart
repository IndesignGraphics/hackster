import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackster/controller/farmer_controller.dart';
import 'package:hackster/screens/other/add_new_crop.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  bool _isDataAvailale = false;
  bool _isYieldInfo = false;
  bool _isBills = false;
  FarmerController farmerController = Get.put(FarmerController());
  late List cropHistoryData;
  late List cropHistoryBills;
  late var farmerData;
  late List yieldInfo;
  late List<dynamic> finalList;

  Future<String> _loadFarmerID() async {
    final prefs = await SharedPreferences.getInstance();
    final currentUser = _auth.currentUser!;
    final userId = currentUser.uid;
    String? encodedData = prefs.getString(userId);
    final decodedData = jsonDecode(encodedData!);
    String mobileNum = decodedData['mobileNo'];

    Uri uri = Uri.parse('https://hack-roso.onrender.com/getfarmer/$mobileNum');
    final farmerJson = await http.get(uri);
    farmerData = jsonDecode(farmerJson.body);

    yieldInfo = farmerData['yeildInfo'];
    print(yieldInfo);

    final url = 'https://hack-roso.onrender.com/getfarmer/${mobileNum}';
    final response = await http.get(Uri.parse(url));
    final fData = jsonDecode(response.body);
    String farmerID = fData['farmId'];

    return farmerID;
  }

  void loadFarmerCropHistory() async {
    String farmerID = await _loadFarmerID();

    Uri uri = Uri.parse('https://hack-roso.onrender.com/getbill/GJAM00000005');
    final cropHistoryRemote = await http.get(uri);
    cropHistoryData = jsonDecode(cropHistoryRemote.body);

    print(cropHistoryData);

    setState(() {
      _isLoading = false;

      if (cropHistoryData.length == 0) {
        _isDataAvailale = false;
      } else {
        cropHistoryBills = cropHistoryData[0]['bills'];
        if (cropHistoryBills.length == 0 && yieldInfo.length == 0) {
          _isDataAvailale = false;
        } else {
          _isDataAvailale = true;
        }

        if (cropHistoryBills != 0) {
          _isBills = true;
        }

        if (yieldInfo.length != 0) {
          _isYieldInfo = true;
        }

        finalList.add(cropHistoryBills);
        finalList.add(yieldInfo);
      }
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
        title: Text("cropHistory".tr),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              child: !_isDataAvailale
                  ? Text('No data available.')
                  : ListView.separated(
                      itemCount: cropHistoryBills.length,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${"landName".tr} : ${finalList[i]['landTitle']}',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '${"year".tr} : ${finalList[i]['year']}',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '${"cropType".tr} : ${finalList[i]['cropType']}',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '${"cropName".tr} : ${finalList[i]['cropName']}',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '${"quantity".tr} : ${finalList[i]['quintity']} Kg',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '${"totalPrice".tr} : ${finalList[i]['totalPrice']}',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      Text(
                                        'Unit : ${finalList[i]['unit']}',
                                        style: const TextStyle(
                                            color: Colors.black),
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
        child: Text("addCrop".tr),
      ),
    );
  }
}
