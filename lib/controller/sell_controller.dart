import 'dart:collection';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class SellController extends GetxController {
  final url = "https://0cc2-103-85-11-140.in.ngrok.io/sell";

  Future<void> sellItem(Product product) async {
    var temp = {
      "cropType": product.cropType,
      "cropName": product.cropName,
      "quantity": product.quantity,
      "price": product.price,
      "unit": product.unit,
      "description": product.description,
      "district": product.district,
      "taluka": product.taluka,
      "villageCity": product.villageCity,
      "contactNumber": product.contactNumber,
      "image":product.image,
      "sellerId": product.sellerId
    };
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://hack-roso.onrender.com/sell'));
    request.body = json.encode(temp);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }
}
