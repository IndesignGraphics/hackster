import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        // margin: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height - 110,
        child: Column(
          children: [
            Card(
              elevation: 5,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Chandkheda',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                    Text(
                      'Ahmedabad',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Today',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Row(
                          children: [
                            Text(
                              '22 C',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.cloud, color: Colors.white, size: 30),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.water_drop,
                              color: Colors.white,
                            ),
                            Text(
                              '1 cm',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.water_drop,
                              color: Colors.white,
                            ),
                            Text(
                              '1 cm',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.water_drop,
                              color: Colors.white,
                            ),
                            Text(
                              '1 cm',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Card(
              elevation: 5,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Market Price',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Card(
                            elevation: 2,
                            clipBehavior: Clip.hardEdge,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.fastfood,
                                    size: 30,
                                  ),
                                  Text(
                                    'Pea',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Column(
                                    children: [
                                      Text('50 Rs'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '+10.00%',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Card(
                            elevation: 2,
                            clipBehavior: Clip.hardEdge,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.fastfood,
                                    size: 30,
                                  ),
                                  Text(
                                    'Pea',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Column(
                                    children: [
                                      Text('50 Rs'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '-10.00%',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'View All Rates',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Card(

            ),
          ],
        ),
      ),
    );
  }
}
