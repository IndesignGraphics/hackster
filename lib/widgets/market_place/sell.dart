import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackster/screens/other/add_new_item_for_sell.dart';

class Sell extends StatelessWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, i) {
              return Card(
                elevation: 3,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${"cropType".tr} : Vegetables',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${"cropName".tr} : Tamatar',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${"quantity".tr} : 200kg',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${"price".tr} : 1500',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${"description".tr} : This is good.',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Image.asset('assets/images/cotton.jpg',
                        width: MediaQuery.of(context).size.width / 2.5),
                  ]),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
