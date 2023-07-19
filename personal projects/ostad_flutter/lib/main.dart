import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad_flutter/style.dart';

import 'home_page.dart';

// TODO 1 - Button for switch theme
// TODO 2 - Update todo
// TODO 3 - Update the ui design of bottom sheet

main() {
  runApp(MyApp());
}

ThemeManager themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      home: const HomeScreen(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
    );
  }
}
