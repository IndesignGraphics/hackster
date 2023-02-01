import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ToolsPage extends StatelessWidget {
  const ToolsPage({Key? key}) : super(key: key);

  static const _listOfFertilizers = [
    {
      'title': 'Chloride',
      'image': 'assets/images/chloride.png',
      'quantity': '1kg',
      'price': '130',
    },
    {
      'title': 'Loh tatva',
      'image': 'assets/images/loh_iron.png',
      'quantity': '1kg',
      'price': '955',
    },
    {
      'title': 'Sulphur',
      'image': 'assets/images/sulphur.png',
      'quantity': '5kg',
      'price': '385',
    },
    {
      'title': 'Calcium',
      'image': 'assets/images/calcium.png',
      'quantity': '5kg',
      'price': '999',
    },
    {
      'title': 'Boron',
      'image': 'assets/images/boron.png',
      'quantity': '1kg',
      'price': '5000',
    }
  ];

  static const _listOfPesticides = [
    {
      'title': 'Confidor Imidacloprid ',
      'image': 'assets/images/imidacloprid.png',
      'quantity': '100ml',
      'price': '370',
    },
    {
      'title': 'Dhanuka Aatank',
      'image': 'assets/images/aatank.png',
      'quantity': '1 ltr',
      'price': '1180',
    },
    {
      'title': 'Dhanuka Omite',
      'image': 'assets/images/omite.png',
      'quantity': '1 ltr',
      'price': '1680',
    },
    {
      'title': 'Utkarsh beveroz',
      'image': 'assets/images/beveroz.png',
      'quantity': '1 ltr',
      'price': '608',
    },
    {
      'title': 'Monosol',
      'image': 'assets/images/monosol.png',
      'quantity': '2 ltr',
      'price': '1181',
    }
  ];

  static const _listOfSeeds = [
    {
      'title': 'Brocolli Seeds',
      'image': 'assets/images/brocolli_seeds.png',
      'quantity': '1 pack',
      'price': '105',
    },
    {
      'title': 'Parsley Seeds',
      'image': 'assets/images/parsley_seeds.png',
      'quantity': '1 pack',
      'price': '105',
    },
    {
      'title': 'Thyme Seeds',
      'image': 'assets/images/thyme_seeds.png',
      'quantity': '1 pack',
      'price': '105',
    },
    {
      'title': 'Red Capsicum Seeds',
      'image': 'assets/images/red_capsicum_seeds.png',
      'quantity': '1 pack',
      'price': '105',
    },
    {
      'title': 'Desi Carrot Seeds',
      'image': 'assets/images/desi_carrot_seeds.png',
      'quantity': '1 pack',
      'price': '87',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.healing),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    "fertilizers".tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  "viewAll".tr,
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _listOfFertilizers.length,
                itemBuilder: (ctx, i) {
                  return Card(
                    elevation: 3,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: 170,
                      height: 220,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              _listOfFertilizers[i]['image']!,
                              height: 130,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            _listOfFertilizers[i]['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'From ₹${_listOfFertilizers[i]['price']}',
                            style: const TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           Text(
                            _listOfFertilizers[i]['quantity']!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.sanitizer),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    "pesticides".tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  "viewAll".tr,
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _listOfPesticides.length,
                itemBuilder: (ctx, i) {
                  return Card(
                    elevation: 3,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: 170,
                      height: 220,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              _listOfPesticides[i]['image']!,
                              height: 130,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                           Text(
                            _listOfPesticides[i]['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                           Text(
                            'From ₹${_listOfPesticides[i]['price']!}',
                            style: const TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           Text(
                            _listOfPesticides[i]['quantity']!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.compost),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    "herbicides".tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  "viewAll".tr,
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (ctx, i) {
                  return Card(
                    elevation: 3,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: 170,
                      height: 220,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(_listOfSeeds[i]['image']!,height: 130,),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                           Text(
                            _listOfSeeds[i]['title']!,
                            style:const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                           Text(
                            'From ₹${_listOfSeeds[i]['price']}',
                            style: const TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           Text(
                            _listOfSeeds[i]['quantity']!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
