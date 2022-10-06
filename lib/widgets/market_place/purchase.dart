import 'package:flutter/material.dart';

class Purchase extends StatelessWidget {
  const Purchase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, i) {
        return SizedBox(
          height: 100,
          child: Card(
            margin: EdgeInsets.all(0),
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/cotton.jpg',
                  fit: BoxFit.cover,
                ),
                Text('Cotton'),
              ],
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
