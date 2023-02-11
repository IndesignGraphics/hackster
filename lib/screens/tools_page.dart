import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackster/controller/cart_controller.dart';
import 'package:hackster/models/tool.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ToolsPage extends StatefulWidget {
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
  State<ToolsPage> createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  int _itemcount = 1;

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());

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
                itemCount: ToolsPage._listOfFertilizers.length,
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
                          Container(
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                ToolsPage._listOfFertilizers[i]['image']!,
                                height: 130,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            ToolsPage._listOfFertilizers[i]['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From ₹${ToolsPage._listOfFertilizers[i]['price']}',
                                      style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      ToolsPage._listOfFertilizers[i]
                                          ['quantity']!,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: SizedBox(
                                    width: 0,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add_box,
                                  ),
                                  iconSize: 30,
                                  color: Colors.green,
                                  onPressed: () {
                                    showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          topRight: Radius.circular(40),
                                        ),
                                      ),
                                      isDismissible: false,
                                      context: context,
                                      builder: (ctx) {
                                        return StatefulBuilder(
                                          builder: (BuildContext bctx,
                                              StateSetter setState) {
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 30),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Add Quantity',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 30,
                                                            horizontal: 10),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: Image.asset(
                                                              ToolsPage
                                                                      ._listOfFertilizers[
                                                                  i]['image']!,
                                                              height: 130,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          ToolsPage
                                                                  ._listOfFertilizers[
                                                              i]['title']!,
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        ToolsPage
                                                                ._listOfFertilizers[
                                                            i]['quantity']!,
                                                        style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: SizedBox(
                                                          width: 1,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          IconButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                if (_itemcount !=
                                                                    0) {
                                                                  _itemcount--;
                                                                }
                                                              });
                                                            },
                                                            icon: Icon(
                                                                Icons.remove),
                                                            splashRadius: 20,
                                                          ),
                                                          Text(
                                                            _itemcount
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18),
                                                          ),
                                                          IconButton(
                                                            splashRadius: 20,
                                                            onPressed: () {
                                                              setState(() {
                                                                if (_itemcount !=
                                                                    10) {
                                                                  _itemcount++;
                                                                }
                                                              });
                                                            },
                                                            icon:
                                                                Icon(Icons.add),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  if (_itemcount == 0)
                                                    Text(
                                                      "You can't have less than 0 quantity",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  if (_itemcount == 10)
                                                    Text(
                                                      "You can't have more than 10 quantity",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    height: 1,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Total Quantity :'),
                                                      Expanded(
                                                        child: SizedBox(
                                                          width: 1,
                                                        ),
                                                      ),
                                                      Text(
                                                        _itemcount.toString(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Total Amount :'),
                                                      Expanded(
                                                        child: SizedBox(
                                                          width: 1,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${_itemcount * int.parse((ToolsPage._listOfFertilizers[i]['price'])!)}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                    // cartController.addToCart(
                                    //   tool: Tool(
                                    //     title: _listOfFertilizers[i]['title'],
                                    //     image: _listOfFertilizers[i]['image'],
                                    //     price: _listOfFertilizers[i]['price'],
                                    //     quantity: _listOfFertilizers[i]['quantity'],
                                    //     category: 'Fertilizers',
                                    //     toolId: 'Fertilizers$i',
                                    //     availableStock: 10,
                                    //   ),
                                    //   count: 1,
                                    // );

                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   SnackBar(
                                    //     content: Text('Item Added'),
                                    //     duration: Duration(seconds: 1),
                                    //   ),
                                    // );
                                  },
                                ),
                              ],
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
                itemCount: ToolsPage._listOfPesticides.length,
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
                          Container(
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                ToolsPage._listOfPesticides[i]['image']!,
                                height: 130,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            ToolsPage._listOfPesticides[i]['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From ₹${ToolsPage._listOfPesticides[i]['price']!}',
                                      style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      ToolsPage._listOfPesticides[i]
                                          ['quantity']!,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: SizedBox(
                                    width: 0,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add_box,
                                  ),
                                  iconSize: 30,
                                  color: Colors.green,
                                  onPressed: () {
                                    showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          topRight: Radius.circular(40),
                                        ),
                                      ),
                                      isDismissible: false,
                                      context: context,
                                      builder: (ctx) {
                                        return StatefulBuilder(
                                          builder: (BuildContext bctx,
                                              StateSetter setState) {
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 30),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Add Quantity',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 30,
                                                            horizontal: 10),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: Image.asset(
                                                              ToolsPage
                                                                      ._listOfPesticides[
                                                                  i]['image']!,
                                                              height: 130,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          ToolsPage
                                                                  ._listOfPesticides[
                                                              i]['title']!,
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        ToolsPage
                                                                ._listOfPesticides[
                                                            i]['quantity']!,
                                                        style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: SizedBox(
                                                          width: 1,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          IconButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                if (_itemcount !=
                                                                    0) {
                                                                  _itemcount--;
                                                                }
                                                              });
                                                            },
                                                            icon: Icon(
                                                                Icons.remove),
                                                            splashRadius: 20,
                                                          ),
                                                          Text(
                                                            _itemcount
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18),
                                                          ),
                                                          IconButton(
                                                            splashRadius: 20,
                                                            onPressed: () {
                                                              setState(() {
                                                                if (_itemcount !=
                                                                    10) {
                                                                  _itemcount++;
                                                                }
                                                              });
                                                            },
                                                            icon:
                                                                Icon(Icons.add),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  if (_itemcount == 0)
                                                    Text(
                                                      "You can't have less than 0 quantity",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  if (_itemcount == 10)
                                                    Text(
                                                      "You can't have more than 10 quantity",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    height: 1,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Total Quantity :'),
                                                      Expanded(
                                                        child: SizedBox(
                                                          width: 1,
                                                        ),
                                                      ),
                                                      Text(
                                                        _itemcount.toString(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Total Amount :'),
                                                      Expanded(
                                                        child: SizedBox(
                                                          width: 1,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${_itemcount * int.parse((ToolsPage._listOfPesticides[i]['price'])!)}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                    // cartController.addToCart(
                                    //   tool: Tool(
                                    //     title: _listOfFertilizers[i]['title'],
                                    //     image: _listOfFertilizers[i]['image'],
                                    //     price: _listOfFertilizers[i]['price'],
                                    //     quantity: _listOfFertilizers[i]['quantity'],
                                    //     category: 'Fertilizers',
                                    //     toolId: 'Fertilizers$i',
                                    //     availableStock: 10,
                                    //   ),
                                    //   count: 1,
                                    // );

                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   SnackBar(
                                    //     content: Text('Item Added'),
                                    //     duration: Duration(seconds: 1),
                                    //   ),
                                    // );
                                  },
                                ),
                              ],
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
                          Container(
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                ToolsPage._listOfSeeds[i]['image']!,
                                height: 130,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            ToolsPage._listOfSeeds[i]['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From ₹${ToolsPage._listOfSeeds[i]['price']}',
                                      style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      ToolsPage._listOfSeeds[i]['quantity']!,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: SizedBox(
                                    width: 0,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add_box,
                                  ),
                                  iconSize: 30,
                                  color: Colors.green,
                                  onPressed: () {
                                    showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          topRight: Radius.circular(40),
                                        ),
                                      ),
                                      isDismissible: false,
                                      context: context,
                                      builder: (ctx) {
                                        return StatefulBuilder(
                                          builder: (BuildContext bctx,
                                              StateSetter setState) {
                                            return Container(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical: 30),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Add Quantity',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                    EdgeInsets.symmetric(
                                                        vertical: 30,
                                                        horizontal: 10),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          alignment:
                                                          Alignment.center,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                10),
                                                            child: Image.asset(
                                                              ToolsPage
                                                                  ._listOfSeeds[
                                                              i]['image']!,
                                                              height: 130,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          ToolsPage
                                                              ._listOfSeeds[
                                                          i]['title']!,
                                                          style:
                                                          const TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        ToolsPage
                                                            ._listOfSeeds[
                                                        i]['quantity']!,
                                                        style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: SizedBox(
                                                          width: 1,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          IconButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                if (_itemcount !=
                                                                    0) {
                                                                  _itemcount--;
                                                                }
                                                              });
                                                            },
                                                            icon: Icon(
                                                                Icons.remove),
                                                            splashRadius: 20,
                                                          ),
                                                          Text(
                                                            _itemcount
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                fontSize: 18),
                                                          ),
                                                          IconButton(
                                                            splashRadius: 20,
                                                            onPressed: () {
                                                              setState(() {
                                                                if (_itemcount !=
                                                                    10) {
                                                                  _itemcount++;
                                                                }
                                                              });
                                                            },
                                                            icon:
                                                            Icon(Icons.add),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  if (_itemcount == 0)
                                                    Text(
                                                      "You can't have less than 0 quantity",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  if (_itemcount == 10)
                                                    Text(
                                                      "You can't have more than 10 quantity",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    height: 1,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Total Quantity :'),
                                                      Expanded(
                                                        child: SizedBox(
                                                          width: 1,
                                                        ),
                                                      ),
                                                      Text(
                                                        _itemcount.toString(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Total Amount :'),
                                                      Expanded(
                                                        child: SizedBox(
                                                          width: 1,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${_itemcount * int.parse((ToolsPage._listOfSeeds[i]['price'])!)}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                    // cartController.addToCart(
                                    //   tool: Tool(
                                    //     title: _listOfFertilizers[i]['title'],
                                    //     image: _listOfFertilizers[i]['image'],
                                    //     price: _listOfFertilizers[i]['price'],
                                    //     quantity: _listOfFertilizers[i]['quantity'],
                                    //     category: 'Fertilizers',
                                    //     toolId: 'Fertilizers$i',
                                    //     availableStock: 10,
                                    //   ),
                                    //   count: 1,
                                    // );

                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   SnackBar(
                                    //     content: Text('Item Added'),
                                    //     duration: Duration(seconds: 1),
                                    //   ),
                                    // );
                                  },
                                ),
                              ],
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
