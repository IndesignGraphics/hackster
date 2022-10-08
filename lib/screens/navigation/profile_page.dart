import 'package:flutter/material.dart';
import 'package:hackster/screens/profile/contact_us.dart';
import 'package:hackster/screens/profile/farm_details.dart';
import 'package:hackster/screens/profile/help_and_support.dart';
import 'package:hackster/screens/profile/privacy_policy.dart';
import 'package:hackster/screens/profile/profile_info.dart';
import 'package:hackster/screens/profile/qualification.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height - 110,
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/cotton.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Farmer Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Farmer Id',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ProfileInfo()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Profile Information'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const FarmDetails()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.agriculture),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Farm Details'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Qualification()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.school),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Qualification'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HelpAndSupport()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.support_agent),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Help and Support'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ContactUs()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.contacts),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Contact Us'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const PrivacyPolicy()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.verified_user),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Privacy Policy'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
