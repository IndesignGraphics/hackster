import 'package:flutter/material.dart';
import 'package:hackster/screens/navigation/market_price.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hackster',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MarketPrice(),
    );
  }
}