import 'package:flutter/material.dart';
import 'package:hackster/screens/other/add_new_crop.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CropHistory extends StatelessWidget {
  const CropHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.cropHistory??'Crop History'),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${AppLocalizations.of(context)?.landName} : Shivji Land',
                            style: const TextStyle(color: Colors.black),
                          ),
                          Text(
                            '${AppLocalizations.of(context)?.year} : 2022',
                            style: const TextStyle(color: Colors.black),
                          ),
                          Text(
                            '${AppLocalizations.of(context)?.cropType} : Fruits',
                            style: const TextStyle(color: Colors.black),
                          ),
                          Text(
                            '${AppLocalizations.of(context)?.cropName} : Banana',
                            style: const TextStyle(color: Colors.black),
                          ),
                          Text(
                            '${AppLocalizations.of(context)?.quantity} : 1000 Kg',
                            style: const TextStyle(color: Colors.black),
                          ),
                          Text(
                            '${AppLocalizations.of(context)?.totalPrice} : 15000',
                            style: const TextStyle(color: Colors.black),
                          ),
                          Text(
                            '${AppLocalizations.of(context)?.harvestingTec} : Hand Harvesting',
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
        child: Text(AppLocalizations.of(context)?.addCrop ?? 'Add Crop'),
      ),
    );
  }
}
