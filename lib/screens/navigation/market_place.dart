import 'package:flutter/material.dart';
import 'package:hackster/widgets/market_place/purchase.dart';
import 'package:hackster/widgets/market_place/sell.dart';

class MarketPlace extends StatelessWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Market Place'),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text('Purchase'),
              ),
              Tab(
                child: Text('Sell'),
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Purchase(),
            Sell(),
          ],
        ),
      ),
    );
  }
}
