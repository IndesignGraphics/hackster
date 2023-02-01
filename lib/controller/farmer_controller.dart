import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FarmerController extends GetxController {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var farmerID = "".obs;
  // var farmerProfileImage = "".obs;
  var farmerMobileNumber = "".obs;

  getFarmerData() async {
    final currentUser = _auth.currentUser!;
    farmerMobileNumber = RxString(currentUser.phoneNumber!.substring(3));
    print(farmerMobileNumber);
    final url = "https://hack-roso.onrender.com/getfarmer/$farmerMobileNumber";
    final response = await http.get(Uri.parse(url));
    final farmerData = jsonDecode(response.body);
    farmerID = RxString(farmerData['farmId']);
    print(farmerID);
  }
}
