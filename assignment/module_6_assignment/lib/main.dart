import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Ostad Module 6 Assignment",
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
        title: const Text("Photos Gallery"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(6.0),
              child: Center(
                child: Text(
                  "Welcome To My Photo Gallery!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: "search",
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    showSnackBar("Photos selected", context);
                  },
                  child: Column(
                    children: [
                      Image.network(
                        "https://st.depositphotos.com/2195902/5037/v/600/depositphotos_50370695-stock-illustration-funny-monkey-with-glasses.jpg",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const Text("Monkey Photos"),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showSnackBar("Photos selected", context);
                  },
                  child: Column(
                    children: [
                      Image.network(
                        "https://st.depositphotos.com/2195902/5037/v/600/depositphotos_50370695-stock-illustration-funny-monkey-with-glasses.jpg",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const Text("Monkey Photos"),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showSnackBar("Photos selected", context);
                  },
                  child: Column(
                    children: [
                      Image.network(
                        "https://st.depositphotos.com/2195902/5037/v/600/depositphotos_50370695-stock-illustration-funny-monkey-with-glasses.jpg",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const Text("Monkey Photos"),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showSnackBar("Photos selected", context);
                  },
                  child: Column(
                    children: [
                      Image.network(
                        "https://st.depositphotos.com/2195902/5037/v/600/depositphotos_50370695-stock-illustration-funny-monkey-with-glasses.jpg",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const Text("Monkey Photos"),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showSnackBar("Photos selected", context);
                  },
                  child: Column(
                    children: [
                      Image.network(
                        "https://st.depositphotos.com/2195902/5037/v/600/depositphotos_50370695-stock-illustration-funny-monkey-with-glasses.jpg",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const Text("Monkey Photos"),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showSnackBar("Photos selected", context);
                  },
                  child: Column(
                    children: [
                      Image.network(
                        "https://st.depositphotos.com/2195902/5037/v/600/depositphotos_50370695-stock-illustration-funny-monkey-with-glasses.jpg",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const Text("Monkey Photos"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  leading: Image.network(
                      "https://st.depositphotos.com/2195902/5037/v/600/depositphotos_50370695-stock-illustration-funny-monkey-with-glasses.jpg"),
                  title: const Text("Sample Photos 1"),
                  subtitle: const Text("Category 1"),
                ),
                ListTile(
                  leading: Image.network(
                      "https://cdn2.vectorstock.com/i/1000x1000/96/81/funny-monkey-in-sunglasses-vector-39519681.jpg"),
                  title: const Text("Sample Photos 2"),
                  subtitle: const Text("Category 2"),
                ),
                ListTile(
                  leading: Image.network(
                      "https://previews.123rf.com/images/sergeiarkhipov/sergeiarkhipov2001/sergeiarkhipov200100006/137241186-funny-monkey-in-sunglasses.jpg"),
                  title: const Text("Sample Photos 3"),
                  subtitle: const Text("Category 3"),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: IconButton(
                color: Colors.blue,
                icon: const Icon(
                  Icons.cloud_upload,
                ),
                iconSize: 80,
                padding: const EdgeInsets.all(8),
                onPressed: () {
                  showSnackBar("Photos upload successfully", context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
