import 'package:flutter/material.dart';
import 'package:module_7_assignment/cart_page.dart';

class Products {
  final String name;
  final double price;
  int item;

  Products({required this.name, required this.price, this.item = 0});
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Products> products = [
    Products(name: "Products 1", price: 39.99),
    Products(name: "Products 2", price: 49.99),
    Products(name: "Products 3", price: 59.99),
    Products(name: "Products 4", price: 69.99),
    Products(name: "Products 5", price: 79.99),
    Products(name: "Products 6", price: 89.99),
    Products(name: "Products 7", price: 99.99),
    Products(name: "Products 8", price: 109.99),
    Products(name: "Products 9", price: 199.99),
    Products(name: "Products 10", price: 129.99),
    Products(name: "Products 11", price: 139.99),
    Products(name: "Products 12", price: 149.99),
    Products(name: "Products 13", price: 159.99),
    Products(name: "Products 14", price: 169.99),
    Products(name: "Products 15", price: 179.99),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products List"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => CartPage(products: products)),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: ListView.separated(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListTile(
              title: Text(products[index].name),
              subtitle: Text("\$${products[index].price.toStringAsFixed(2)}"),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Count = ${products[index].item}"),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          products[index].item++;
                          if (products[index].item == 5) {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text("Congratulation"),
                                content: Text(
                                    "You've bought 5 of ${products[index].name}!"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Ok"))
                                ],
                              ),
                            );
                          }
                        });
                      },
                      child: const Text("Buy"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 1,
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
