import 'package:flutter/material.dart';
import 'package:hackster/widgets/market_place/purchase.dart';
import 'package:hackster/widgets/market_place/sell.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MarketPlace extends StatelessWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)?.marketPlace ?? 'Market Place'),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(AppLocalizations.of(context)?.purchase ?? 'Purchase'),
              ),
              Tab(
                child: Text(AppLocalizations.of(context)?.sell ?? 'Sell'),
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
