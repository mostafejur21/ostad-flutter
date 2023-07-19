import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_crud/products.dart';
import 'package:flutter_crud/products_create_screen.dart';
import 'package:flutter_crud/rest_api.dart';
import 'package:flutter_crud/update_screen.dart';
import 'package:http/http.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Products> products = [];
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  getProducts() async {
    inProgress = true;
    setState(() {});
    Response response =
        await get(Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'));
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse['status'] == 'success') {
      products.clear();
      for (var e in decodedResponse['data']) {
        products.add(Products.toJson(e));
      }
    }
    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('CRUD'),
          actions: [
            IconButton(
                onPressed: () async {
                  await getProducts();
                  setState(() {});
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductsCreateScreen()));
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0xFF701ebd),
                  Color(0xFF873bcc),
                  Color(0xFFfe4a97),
                  Color(0xFFe17763),
                  Color(0xFF68998c),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: inProgress
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.transparent,
                          elevation: 5,
                          semanticContainer: false,
                          child: ListTile(
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                      titlePadding:
                                          const EdgeInsets.only(left: 16),
                                      contentPadding: const EdgeInsets.only(
                                          left: 8, right: 8, bottom: 8),
                                      title: Row(
                                        children: [
                                          const Text('Choose an action'),
                                          const Spacer(),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(Icons.close),
                                          )
                                        ],
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            onTap: () {
                                              Navigator.pop(context);
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProductsUpdateScreen(products: products[index])));
                                            },
                                            leading: const Icon(Icons.edit),
                                            title: const Text('Edit'),
                                          ),
                                          const Divider(
                                            height: 0,
                                          ),
                                          ListTile(
                                            onTap: () async {
                                              Navigator.pop(context);
                                              await productsDeleteRequest(
                                                  products[index].id);
                                              products.clear();
                                              getProducts();
                                            },
                                            leading: const Icon(
                                                Icons.delete_forever_outlined),
                                            title: const Text('Delete'),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            title: Text(products[index].productName),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Product code: ${products[index].productsCode}'),
                                Text(
                                    'Total price: ${products[index].totalPrice}'),
                                Text(
                                    'Available units: ${products[index].quantity}'),
                              ],
                            ),
                            leading:
                                Image.network(products[index].image, width: 50,
                                    errorBuilder: (context, obj, stackTrace) {
                              return const Icon(
                                Icons.image,
                                size: 32,
                              );
                            }),
                            trailing: Text('${products[index].unitPrice}/p'),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
            ),
          ],
        ));
  }
}
