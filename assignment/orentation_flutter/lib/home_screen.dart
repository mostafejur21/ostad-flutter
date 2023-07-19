import 'package:flutter/material.dart';
import 'package:orentation_flutter/landscape_screen.dart';
import 'package:orentation_flutter/portrait_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Orientation"),
        ),
        body: OrientationBuilder(
            builder: (context, orientation) =>
                orientation == Orientation.portrait
                    ? PortraitScreen()
                    : LandscapeScreen()));
  }
}
