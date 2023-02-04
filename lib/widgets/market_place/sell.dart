import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackster/controller/farmer_controller.dart';
import 'package:hackster/screens/other/add_new_item_for_sell.dart';

import '../../controller/sell_controller.dart';

class Sell extends StatefulWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  SellController sellController = Get.put(SellController());
  FarmerController farmerController = Get.put(FarmerController());
  List filterData = [];
  bool _isLoading = true;

  @override
  void initState() {
    loadData();

    super.initState();
  }

  void loadData() async {
    final data = await sellController.getItem();

    var farmerId = farmerController.farmerID;
    var length = data.length;

    for (int i = 0; i < length; i++) {
      var sellerId = data[i]['sellerId'];

      if (farmerId == sellerId) {
        filterData.add(data[i]);
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
                child: ListView.builder(
                  itemCount: filterData.length,
                  itemBuilder: (context, i) {
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      resizeDuration: Duration(milliseconds: 500),
                      background: Container(
                        padding: EdgeInsets.only(right: 28.0),
                        alignment: AlignmentDirectional.centerEnd,
                        color: Colors.red,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      key: Key(filterData[i]['description']),
                      onDismissed: (direction) {
                        filterData.removeAt(i);

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Item removed'),
                          duration: const Duration(seconds: 1),
                        ));
                      },
                      child: Card(
                        elevation: 3,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${"cropType".tr} : ${filterData[i]['cropType']}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    '${"cropName".tr} : ${filterData[i]['cropName']}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    '${"quantity".tr} : ${filterData[i]['quantity']}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    '${"price".tr} : ${filterData[i]['price']}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    '${"description".tr} : ${filterData[i]['description']}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Image.memory(base64Decode(filterData[i]['image']),
                                width: MediaQuery.of(context).size.width / 2.5),
                          ]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const AddNewItemForSell()),
                  ),
                );
              },
              child: Text("addNewItemForSell".tr),
            ),
          );
  }
}
