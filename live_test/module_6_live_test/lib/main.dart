import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shopping Apps",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  showSnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Shopping List"),
        actions: [
          IconButton(
              onPressed: () {
                showSnackBar("Cart is empty", context);
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: const [
          ListTile(
            title: Text(
              "Egg",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.egg),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              "Bread",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.breakfast_dining_outlined),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              "Coffee",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.free_breakfast),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              "Milk",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.shopping_basket_outlined),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              "Bananas",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.shopping_bag_outlined),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              "Mango",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.fastfood_rounded),
          ),
        ],
      ),
    );
  }
}
