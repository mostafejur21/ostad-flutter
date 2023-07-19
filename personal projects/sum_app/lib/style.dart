import 'package:flutter/material.dart';

InputDecoration formInputDecoration(lebel) {
  return InputDecoration(
    labelText: lebel,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
