import 'package:flutter/material.dart';

class PortraitScreen extends StatelessWidget {
  const PortraitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
        });
  }
}
