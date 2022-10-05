import 'package:flutter/material.dart';

class MarketPrice extends StatelessWidget {
  const MarketPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Market Price'),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Text('Market Price'),
        ));
  }
}
