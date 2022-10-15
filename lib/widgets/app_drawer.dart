import 'package:flutter/material.dart';
import 'package:hackster/screens/navigation/agri_business.dart';
import 'package:hackster/screens/navigation/credit_insurance.dart';
import 'package:hackster/screens/navigation/crop_history.dart';
import 'package:hackster/screens/navigation/expert_talk.dart';
import 'package:hackster/screens/navigation/live_stock.dart';
import 'package:hackster/screens/navigation/market_place.dart';
import 'package:hackster/screens/navigation/market_price.dart';
import 'package:hackster/screens/navigation/soil_test.dart';
import 'package:hackster/screens/navigation/weather.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../screens/navigation/profile_page.dart';

class AppDrawer extends StatelessWidget {

  final String farmerName,mobileNumber,profilePic;
  const AppDrawer({Key? key, required this.farmerName, required this.mobileNumber, required this.profilePic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(profilePic),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  farmerName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProfilePage(mobile: mobileNumber,)));
                  },
                  child: Text(
                    AppLocalizations.of(context)?.viewProfile ?? "View Profile",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
              leading: const Icon(Icons.credit_card),
              title: Text(AppLocalizations.of(context)?.creditInsurance ?? "Credit/Insurance"),
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreditInsurance()));
              }),
          ListTile(
            leading: const Icon(Icons.currency_rupee),
            title: Text(AppLocalizations.of(context)?.marketPrice ?? "Market Price"),
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MarketPrice()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.storefront),
            title: Text(AppLocalizations.of(context)?.marketPlace??"Market Place"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MarketPlace()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.agriculture),
            title: Text(AppLocalizations.of(context)?.cropHistory??"Crop History"),
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CropHistory()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.biotech),
            title: Text(AppLocalizations.of(context)?.soilTest ?? "Soil Test"),
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SoilTest()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.cloudy_snowing),
            title: Text(AppLocalizations.of(context)?.weather ?? "Weather"),
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Weather()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.business),
            title: Text(AppLocalizations.of(context)?.agriBusiness ?? "AgriBusiness"),
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AgriBusiness()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_answer),
            title: Text(AppLocalizations.of(context)?.expertTalk ?? "Expert Talk"),
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ExpertTalk()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.pets),
            title: Text(AppLocalizations.of(context)?.liveStock ?? "Livestock"),
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LiveStock()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(AppLocalizations.of(context)?.logOut ?? "Logout"),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Logout'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
