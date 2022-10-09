import 'package:flutter/material.dart';

class LiveStock extends StatelessWidget {
  const LiveStock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> listOfLiveStock = [
      'Cattle & Buffalo Development',
      'Fodder Development',
      'Poultry Development',
      'Dairy Development',
      'Veterinary Service and Animal Health',
      'Sheep, Goat and Wool Development',
      'Other Live Stock Development',
      'Horse and Camel Development',
      'Sheep Development Branch',
      'LiveStock Health (Statistics)'
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('LiveStock'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/images/livestock.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 270,
                child: ListView.separated(
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor),
                            child: Text(
                              listOfLiveStock[i],
                              style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: (){},
                      );
                    },
                    separatorBuilder: (context, i) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: listOfLiveStock.length),
              ),
            )
          ],
        ));
  }
}
