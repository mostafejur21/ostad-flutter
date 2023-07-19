import 'package:flutter/material.dart';

InputDecoration customInputDecoration(IconData icon, String text) {
  return InputDecoration(
    prefixIcon: Icon(
      icon,
      color: Colors.purple[700],
    ),
    hintText: text,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.white60),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.white60),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
    filled: true,
    fillColor: Colors.white60,
  );
}
