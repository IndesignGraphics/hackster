import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackster/widgets/market_place/purchase.dart';
import 'package:hackster/widgets/market_place/sell.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MarketPlace extends StatelessWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("marketPlace".tr),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text("purchase".tr),
              ),
              Tab(
                child: Text("sell".tr),
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
