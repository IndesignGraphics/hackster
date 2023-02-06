import 'dart:collection';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:hackster/models/cart_item.dart';
import 'package:hackster/models/tool.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class CartController extends GetxController {
  List<CartItem> _items = [];

  void addToCart({Tool? tool,int? count}) {
    // var temp = {
    //   'toolInfo' : tool,
    //   'itemCount' : count
    // };
    CartItem cartItem = CartItem(tool: tool,count: count);

    _items.add(cartItem);
  }

  List<CartItem> getCart(){
    return _items;
  }

}
