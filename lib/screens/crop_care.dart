import 'package:flutter/material.dart';

class CropCare extends StatelessWidget {
  const CropCare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 135,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 110,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.healing,
                        size: 50,
                      ),
                      Text(
                        'Fertilizers',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 110,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.sanitizer,
                        size: 50,
                      ),
                      Text(
                        'Pesticides',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 110,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.lightbulb,
                        size: 50,
                      ),
                      Text(
                        'Tips',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 300,
              padding: const EdgeInsets.all(10),
              color: Colors.blueGrey.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Heal Your Crop',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: const [
                          Icon(
                            Icons.add_a_photo,
                            size: 100,
                          ),
                          Text('Take Picture')
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios),
                      Column(
                        children: const [
                          Icon(
                            Icons.security_update_warning,
                            size: 100,
                          ),
                          Text('See Diagnosis')
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios),
                      Column(
                        children: const [
                          Icon(
                            Icons.medical_services,
                            size: 100,
                          ),
                          Text('Get Medicine')
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Take a Picture',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Previous Pictures'),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blueGrey,
                        ),
                        child: const Text('View All'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 125,
                    child: ListView.separated(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          clipBehavior: Clip.hardEdge,
                          child: SizedBox(
                            height: 125,
                            width: 125,
                            child: Image.asset(
                              'assets/images/cotton.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, i) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
