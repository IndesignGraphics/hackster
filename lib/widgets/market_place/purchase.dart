import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackster/controller/farmer_controller.dart';
import 'package:hackster/controller/sell_controller.dart';

class Purchase extends StatefulWidget {
  const Purchase({Key? key}) : super(key: key);

  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  bool _isLoading = true;
  SellController sellController = Get.put(SellController());
  FarmerController farmerController = Get.put(FarmerController());

  List itemData = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    final data = await sellController.getItem();

    var farmerId = farmerController.farmerID;
    var length = data.length;

    for (int i = 0; i < length; i++) {
      var sellerId = data[i]['sellerId'];

      if (farmerId != sellerId) {
        itemData.add(data[i]);
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height,
                child: itemData.isEmpty
                    ? const Center(
                        child: Text('No data found.'),
                      )
                    : ListView.builder(
                        itemCount: itemData.length,
                        itemBuilder: (context, i) {
                          return Card(
                            elevation: 3,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${"cropType".tr} : ${itemData[i]['cropType']}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        '${"cropName".tr} : ${itemData[i]['cropName']}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        '${"quantity".tr} : ${itemData[i]['quantity']}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        '${"price".tr} : ${itemData[i]['price']}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        '${"description".tr} : ${itemData[i]['description']}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        '${"contactNumber".tr} : ${itemData[i]['contactNumber']}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                Image.memory(base64Decode(itemData[i]['image']),
                                    width: MediaQuery.of(context).size.width /
                                        2.5),
                              ]),
                            ),
                          );
                        },
                      ),
              ),
            ),
          );
  }
}
