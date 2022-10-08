import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackster/screens/navigation/weather.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height - 160,
        child: Column(
          children: [
            SizedBox(
              height: 75,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, i) {
                  if (i == 0) {
                    return Container(
                      width: 75,
                      height: 75,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.green.shade900, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add),
                      ),
                    );
                  }
                  return Container(
                    width: 75,
                    height: 75,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.green.shade900, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/cotton.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Weather()));
              },
              child: Card(
                elevation: 5,
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF2A3832),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Chandkheda',
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      const Text(
                        'Ahmedabad',
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Today',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Row(
                            children: const [
                              Text(
                                '22 °C',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.cloud,
                                color: Colors.white,
                                size: 30,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: SvgPicture.asset(
                                    'assets/svgs/umbrella.svg'),
                              ),
                              Text(
                                '1 cm',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                  height: 43,
                                  child: Center(
                                    child: SvgPicture.asset(
                                        'assets/svgs/wind.svg'),
                                  ),
                                ),
                              ),
                              Text(
                                '15 km/h',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: SvgPicture.asset(
                                    'assets/svgs/humidity.svg'),
                              ),
                              Text(
                                '50%',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 3,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF4F7F5),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.green,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Market Price',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        elevation: 1,
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
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
                                        color: Colors.green, fontSize: 13),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        elevation: 1,
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset('assets/images/chilli.png'),
                              const Text(
                                'Chilli',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SvgPicture.asset(
                                  'assets/svgs/negative_graph.svg'),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    '₹36.83',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    '-7.36%',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 13),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'View All Rates',
                            style: TextStyle(
                                color: Color(0xFF2A3832), fontSize: 15),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF2A3832),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Card(),
          ],
        ),
      ),
    );
  }
}
