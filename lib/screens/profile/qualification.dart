import 'package:flutter/material.dart';

class Qualification extends StatelessWidget {
  const Qualification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qualification'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (ctx, i) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Image.asset('assets/images/cotton.jpg'),
              );
            }),
      ),
    );
  }
}
