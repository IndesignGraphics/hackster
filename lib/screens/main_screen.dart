import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackster/controller/farmer_controller.dart';
// import 'package:hackster/provider/locale_provider.dart';

// import 'package:hackster/screens/crop_care.dart';
import 'package:hackster/screens/government_scheme.dart';
import 'package:hackster/screens/shop_cart.dart';
import 'package:hackster/screens/tools_page.dart';
import 'package:hackster/widgets/app_drawer.dart';
// import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String farmerName, mobileNumber, profilePic;

  bool _isLoading = true;

  final FarmerController _farmerController = Get.put(FarmerController());

  void getFarmerData() async {
    final prefs = await SharedPreferences.getInstance();
    final currentUser = _auth.currentUser!;
    final userId = currentUser.uid;
    String? encodedData = prefs.getString(userId);
    final decodedData = jsonDecode(encodedData!);
    String mobileNum = decodedData['mobileNo'];
    final url = "https://hack-roso.onrender.com/getfarmer/$mobileNum";
    final response = await http.get(Uri.parse(url));
    final farmerData = jsonDecode(response.body);
    final fName = farmerData['perinfo']['firstName'];
    final lName = farmerData['perinfo']['lastName'];
    final image = farmerData['profilePic'];
    setState(() {
      farmerName = fName + " " + lName;
      mobileNumber = mobileNum;
      profilePic = image;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': const HomePage()},
      {'page': const GovernmentScheme()},
      {'page': const ToolsPage()},
    ];
    getFarmerData();
    _farmerController.getFarmerData();
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<LocaleProvider>(context, listen: false);
    return _isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(farmerName),
              actions: [
                // IconButton(
                //   onPressed: () {},
                //   icon: const Icon(Icons.notifications),
                // ),
                DropdownButton<String>(
                  dropdownColor: Theme.of(context).primaryColor,
                  value: "language".tr,
                  items: const [
                    DropdownMenuItem(
                      value: 'English',
                      child: Text(
                        'Eng',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'ગુજરાતી',
                      child: Text(
                        'ગુજ',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                  onChanged: (value) {
                    if (value == 'English') {
                      var locale = const Locale('en');
                      Get.updateLocale(locale);
                      // provider.locale = const Locale('en');
                    } else {
                      var locale = const Locale('gu');
                      Get.updateLocale(locale);
                      // provider.locale = const Locale('gu');
                    }
                  },
                ),
                IconButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => ShopCart())));
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
              ],
            ),
            drawer: AppDrawer(
              farmerName: farmerName,
              mobileNumber: mobileNumber,
              profilePic: profilePic,
            ),
            body: _pages[_selectedPageIndex]['page'] as Widget,
            bottomNavigationBar: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.black,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: _selectedPageIndex == 0
                      ? const Icon(Icons.home_filled)
                      : const Icon(Icons.home_outlined),
                  label: "home".tr,
                ),
                BottomNavigationBarItem(
                  icon: _selectedPageIndex == 1
                      ? const Icon(Icons.paid)
                      : const Icon(Icons.paid_outlined),
                  label: "governmentScheme".tr,
                ),
                BottomNavigationBarItem(
                  icon: _selectedPageIndex == 2
                      ? const Icon(Icons.handyman)
                      : const Icon(Icons.handyman_outlined),
                  label: "tools".tr,
                ),
              ],
            ),
          );
  }
}
