import 'dart:collection';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:hackster/models/tool.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class OrderController extends GetxController {
// String farmerid;
// String farmername;
// farmeraddress;
// orderid;
// itemlist of products;
List _items = [];

  void addToCart(Tool tool,int count) {
    var temp = {
      'toolInfo' : tool,
      'itemCount' : count
    };

    _items.add(temp);
  }

  List getCart(){
    return _items;
  }

}
