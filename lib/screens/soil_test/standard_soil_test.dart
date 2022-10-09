import 'package:flutter/material.dart';

class StandardSoilTest extends StatelessWidget {
  const StandardSoilTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Standard Soil Test'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/standard_soil_test.png'),
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
            const SizedBox(
              height: 5,
            ),
            const Text(
              '7. Calcium',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '8. Magnesium',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '9. Sulfur',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '10. Zinc',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '11. Manganese',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '12. Iron',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '13. Copper',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '14. Boron',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
