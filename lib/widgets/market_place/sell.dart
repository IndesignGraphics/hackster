import 'package:flutter/material.dart';
import 'package:hackster/screens/other/add_new_item_for_sell.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                            '${AppLocalizations.of(context)?.cropType} : Vegetables',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${AppLocalizations.of(context)?.cropName} : Tamatar',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${AppLocalizations.of(context)?.quantity} : 200kg',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${AppLocalizations.of(context)?.price} : 1500',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${AppLocalizations.of(context)?.description} : This is good.',
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
        child: Text(AppLocalizations.of(context)?.addNewItemForSell??'Add new item for sell'),
      ),
    );
  }
}
