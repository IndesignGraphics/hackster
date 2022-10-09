import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        backgroundColor: const Color(0xFF2A3832),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFF2A3832),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Chandkheda,',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            const Text(
              'Gujarat',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Tue,Jun 30',
              style: TextStyle(
                color: Color(0xFF9A938C),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svgs/cloudy.svg'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const Text(
                          '19',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Rainy',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '°C',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              child: Card(
                color: Color(0xFF77807C),
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SvgPicture.asset('assets/svgs/umbrella.svg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'RainFall',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(
                        '1cm',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Card(
                color: Color(0xFF77807C),
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          height: 43,
                          child: Center(
                            child: SvgPicture.asset('assets/svgs/wind.svg'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'Wind',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(
                        '17km/h',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Card(
                color: Color(0xFF77807C),
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SvgPicture.asset('assets/svgs/humidity.svg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'Humidity',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(
                        '50%',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 102,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 11),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFF69736F),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'now',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        SvgPicture.asset('assets/svgs/sun.svg'),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          '19 °',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
