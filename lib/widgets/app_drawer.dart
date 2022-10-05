import 'package:flutter/material.dart';

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
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
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
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.currency_rupee),
              title: Text("Market Price"),
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.storefront),
              title: Text("Market Place"),
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.agriculture),
              title: Text("Crop History"),
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.biotech),
              title: Text("Soil Test"),
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.cloudy_snowing),
              title: Text("Weather"),
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.business),
              title: Text("AgriBusiness"),
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.question_answer),
              title: Text("Expert Talk"),
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.pets),
              title: Text("Livestock"),
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}
