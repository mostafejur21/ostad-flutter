import 'package:flutter/material.dart';
import 'package:module_10_live_test/portrait_screen.dart';

import 'landscape_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NEWS FEED"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.portrait
            ? PortraitScreen()
            : LandscapeScreen(),
      ),
    );
  }
}
