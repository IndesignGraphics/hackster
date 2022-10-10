import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarketPrice extends StatefulWidget {
  const MarketPrice({Key? key}) : super(key: key);

  @override
  State<MarketPrice> createState() => _MarketPriceState();
}

class _MarketPriceState extends State<MarketPrice> {
  var items = [
    'Rajkot',
    'Ahmedabad',
    'Vadodara',
    'Surat',
    'Gandhinagar',
  ];
  String dropDownValue = 'Rajkot';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Market Price'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButton(
                          dropdownColor: Theme.of(context).primaryColor,
                          value: dropDownValue,
                          onChanged: (String? value) {
                            setState(() {
                              dropDownValue = value!;
                            });
                          },
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Vegetables',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Aug 09,2022',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset('assets/svgs/positive_graph.svg',
                            height: 70),
                        const Text(
                          '+1.50%',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: AppBar(
                  backgroundColor: Colors.white,
                  bottom: TabBar(
                    indicatorWeight: 3,
                    labelColor: Theme.of(context).primaryColor,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    unselectedLabelStyle:
                        const TextStyle(fontWeight: FontWeight.normal),
                    isScrollable: true,
                    tabs: const [
                      Tab(
                        text: 'Vegetables',
                      ),
                      Tab(
                        text: 'Fruits',
                      ),
                      Tab(
                        text: 'Cereals',
                      ),
                      Tab(
                        text: 'Pulses',
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (ctx, i) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          color: Colors.white,
                          child: Center(
                            child: Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset('assets/images/pea.png'),
                                    const Text(
                                      'Pea',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                        'assets/svgs/positive_graph.svg'),
                                    SizedBox(
                                      height: 40,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const [
                                          Text(
                                            '₹58.23',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            '+10.00%',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (ctx, i) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          color: Colors.white,
                          child: Center(
                            child: Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset('assets/images/pea.png'),
                                    const Text(
                                      'Apple',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                        'assets/svgs/negative_graph.svg'),
                                    SizedBox(
                                      height: 40,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const [
                                          Text(
                                            '₹58.23',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            '-10.00%',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (ctx, i) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          color: Colors.white,
                          child: Center(
                            child: Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset('assets/images/pea.png'),
                                    const Text(
                                      'Wheat',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                        'assets/svgs/positive_graph.svg'),
                                    SizedBox(
                                      height: 40,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const [
                                          Text(
                                            '₹58.23',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            '+10.00%',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (ctx, i) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          color: Colors.white,
                          child: Center(
                            child: Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset('assets/images/pea.png'),
                                    const Text(
                                      'Green Gram',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                        'assets/svgs/positive_graph.svg'),
                                    SizedBox(
                                      height: 40,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const [
                                          Text(
                                            '₹58.23',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            '+10.00%',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
