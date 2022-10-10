import 'package:flutter/material.dart';
import 'package:hackster/screens/other/add_new_crop.dart';

class CropHistory extends StatelessWidget {
  const CropHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop History'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
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
                        children: const [
                          Text(
                            'Land Title',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Year',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Crop Type',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Crop Name',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Quantity',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Total Price',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Harvesting Tec.',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            'Shivji Land',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            '2022',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Fruits',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Banana',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            '1000 kg',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            '15000',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Hand Harvesting',
                            style: TextStyle(color: Colors.black),
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
          itemCount: 5,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>const AddNewCrop(),
            ),
          );
        },
        child: const Text('Add Crop'),
      ),
    );
  }
}
