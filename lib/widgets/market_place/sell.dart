import 'package:flutter/material.dart';
import 'package:hackster/screens/other/add_new_item_for_sell.dart';

class Sell extends StatelessWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, i) {
              return Card(
                elevation: 3,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Crop Type : Vegetables',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text('Crop Name : Tamatar',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text('Quantity : 200kg',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text('Price : 1500',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text('Description : This is good.',
                            style: TextStyle(fontSize: 16),
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
              builder: ((context) => AddNewItemForSell()),
            ),
          );
        },
        child: Text('Add new item for sell'),
      ),
    );
  }
}
