import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hackster/controller/cart_controller.dart';
import 'package:hackster/models/cart_item.dart';

class ShopCart extends StatefulWidget {
  const ShopCart({super.key});

  @override
  State<ShopCart> createState() => _ShopCartState();
}

class _ShopCartState extends State<ShopCart> {
  CartController cartController = Get.put(CartController());
  List<CartItem> _cartItems = [];

  @override
  void initState() {
    // TODO: implement initState

    _cartItems = cartController.getCart();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: _cartItems.length == 0
          ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.production_quantity_limits,
                    size: 72,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: ((context, index) {
                return Text(_cartItems[index].tool!.title.toString());
              }),
              itemCount: _cartItems.length,
            ),
    );
  }
}
