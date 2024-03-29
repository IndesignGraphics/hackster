import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackster/screens/profile/bank_info.dart';
import 'package:hackster/screens/profile/contact_us.dart';
import 'package:hackster/screens/profile/farm_details.dart';
import 'package:hackster/screens/profile/help_and_support.dart';
import 'package:hackster/screens/profile/privacy_policy.dart';
import 'package:hackster/screens/profile/profile_info.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'package:hackster/screens/profile/qualification.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  final String mobile;

  const ProfilePage({Key? key, required this.mobile}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isLoading = true;
  late String farmerName, farmerID, profile;
  var farmerData;

  void loadFarmerData() async {
    final url = 'https://hack-roso.onrender.com/getfarmer/${widget.mobile}';
    final response = await http.get(Uri.parse(url));
    final fData = jsonDecode(response.body);
    final fName = fData['perinfo']['firstName'];
    final lName = fData['perinfo']['lastName'];
    setState(() {
      farmerName = fName + " " + lName;
      profile = fData['profilePic'];
      farmerID = fData['farmId'];
      farmerData = fData;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    loadFarmerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile".tr),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height - 110,
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(profile),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      farmerName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      farmerID,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ProfileInfo(
                                      farmerData: farmerData,
                                      farmerName: farmerName,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  children: [
                                    const Icon(Icons.person),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text("profileInformation".tr),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => FarmDetails(
                                      farmerData: farmerData,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  children: [
                                    const Icon(Icons.agriculture),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text("farmDetails".tr),
                                  ],
                                ),
                              ),
                            ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) =>
                            //             const Qualification()));
                            //   },
                            //   child: Padding(
                            //     padding: const EdgeInsets.symmetric(
                            //         horizontal: 10, vertical: 5),
                            //     child: Row(
                            //       children: const [
                            //         Icon(Icons.school),
                            //         SizedBox(
                            //           width: 10,
                            //         ),
                            //         Text('Qualification'),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BankInfo(widget.mobile),
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  children: [
                                    const Icon(Icons.account_balance),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text("bankDetails".tr),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const HelpAndSupport()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  children: [
                                    const Icon(Icons.support_agent),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text("helpAndSupport".tr),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const ContactUs()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  children: [
                                    const Icon(Icons.contacts),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text("contactUs".tr),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const PrivacyPolicy()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  children:[
                                    const Icon(Icons.verified_user),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text("privacyPolicy".tr),
                                  ],
                                ),
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
