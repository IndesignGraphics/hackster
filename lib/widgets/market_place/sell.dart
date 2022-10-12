import 'package:flutter/material.dart';
import 'package:hackster/screens/other/add_new_item_for_sell.dart';

class Sell extends StatelessWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, i) {
              return Text('Sell Item ${i + 1}');
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
