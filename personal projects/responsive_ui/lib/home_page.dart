import 'package:flutter/material.dart';
import 'package:responsive_ui/Responsive/mobile_body.dart';
import 'package:responsive_ui/Responsive/responsive_layout.dart';

import 'Responsive/desktop_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileBody(),
        desktopBody: DesktopBody(),
      ),
    );
  }
}
