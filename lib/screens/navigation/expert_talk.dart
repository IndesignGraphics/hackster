import 'package:flutter/material.dart';

class ExpertTalk extends StatelessWidget {
  const ExpertTalk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expert Talk'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Get To Know Us',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text(
              "We're here to help",
              style: TextStyle(color: Color(0xFF3A3636), fontSize: 20),
            ),
            const Text(
              'Feel Free to ask Questions on',
              style: TextStyle(color: Color(0xFF3A3636), fontSize: 20),
            ),
            const Text(
              'Various topics.',
              style: TextStyle(color: Color(0xFF3A3636), fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Fertilizer Expert',
              style: TextStyle(
                  color: Color(0xFF3A3636),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        'assets/images/rohan_sharma.png',
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Rohan Sharma',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                        const Text('Msc in agriculture'),
                        Row(
                          children: const [
                            Icon(Icons.phone),
                            SizedBox(width: 5,),
                            Text('+919229436658'),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.message),
                            SizedBox(width: 5,),
                            Text('rohan@gmail.com'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Pesticide Expert',
              style: TextStyle(
                  color: Color(0xFF3A3636),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        'assets/images/murray_isman.png',
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Murray Isman',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                        const Text('Msc in agriculture'),
                        Row(
                          children: const [
                            Icon(Icons.phone),
                            SizedBox(width: 5,),
                            Text('+919479436658'),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.message),
                            SizedBox(width: 5,),
                            Text('murray@gmail.com'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Livestock Expert',
              style: TextStyle(
                  color: Color(0xFF3A3636),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        'assets/images/neha_patel.png',
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Neha Patel',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                        const Text('Bsc in agriculture'),
                        Row(
                          children: const [
                            Icon(Icons.phone),
                            SizedBox(width: 5,),
                            Text('+919229436658'),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.message),
                            SizedBox(width: 5,),
                            Text('neha@gmail.com'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
