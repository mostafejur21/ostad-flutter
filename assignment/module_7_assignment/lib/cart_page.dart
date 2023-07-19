import 'package:flutter/material.dart';
import 'home_page.dart';

class CartPage extends StatelessWidget {
  final List<Products> products;

  const CartPage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    num totalQuantity = 0;
    for (var product in products) {
      totalQuantity += product.item;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Total Products: $totalQuantity'),
      ),
    );
  }
}
