import 'package:flutter/material.dart';

class LandscapeScreen extends StatelessWidget {
  const LandscapeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 10,
      itemBuilder: (context, int index) {
        return Card(
          child: ListTile(
            title: Center(
              child: Container(
                height: 150,
                width: 150,
                color: Colors.grey,
                child: const Center(
                  child: Text("150X150"),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
