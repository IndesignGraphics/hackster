import 'package:flutter/material.dart';

class BasicSoilTest extends StatelessWidget {
  const BasicSoilTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Soil Test'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/basic_soil_test.png'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Test Includes',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '1. pH',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '2. Organic Carbon',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '3. Potassium',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '4. Phosphorus',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '5. Electrical Conductivity',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '6. Nitrogen',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
