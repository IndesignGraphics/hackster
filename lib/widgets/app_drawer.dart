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

import '../screens/navigation/profile_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.account_circle,
                    size: 50,
                  ),
                  radius: 30,
                ),
                SizedBox(height: 12),
                Text(
                  "FARMER NAME",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
                  },
                  child: Text(
                    "View Profile",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
          ),
          InkWell(
            child: ListTile(
                leading: Icon(Icons.credit_card),
                title: Text("Credit/Insurance"),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CreditInsurance()));
                }),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.currency_rupee),
              title: Text("Market Price"),
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MarketPrice()));
              },
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.storefront),
              title: Text("Market Place"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MarketPlace()));
              },
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.agriculture),
              title: Text("Crop History"),
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CropHistory()));
              },
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.biotech),
              title: Text("Soil Test"),
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SoilTest()));
              },
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.cloudy_snowing),
              title: Text("Weather"),
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Weather()));
              },
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.business),
              title: Text("AgriBusiness"),
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AgriBusiness()));
              },
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.question_answer),
              title: Text("Expert Talk"),
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ExpertTalk()));
              },
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.pets),
              title: Text("Livestock"),
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LiveStock()));
              },
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Logout'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
