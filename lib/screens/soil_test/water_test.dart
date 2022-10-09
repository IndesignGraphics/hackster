import 'package:flutter/material.dart';

class WaterTest extends StatelessWidget {
  const WaterTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Test'),
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
              '1. Turbidity',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '2. Temperature',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '3. pH',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '4. Acidity',
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
              '6. Alkalinity',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '7. Bacteria',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '8. Viruses',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '9. Chloride',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '10. Dissolved oxygen',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '11. Hardness',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '12. Biochemical oxygen demand (BOD)',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '13. Chemical oxygen demand (COD)',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '14. Radioactive substances',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
