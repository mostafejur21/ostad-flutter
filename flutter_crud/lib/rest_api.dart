import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

var postHeader = {"Content-Type": "application/json"};
Future<bool> productsCreateRequest(formValue) async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var postBody = json.encode(formValue);

  var response = await http.post(URL, headers: postHeader, body: postBody);
  if (response.statusCode == 200 &&
      json.decode(response.body)['status'] == "success") {
    successToast("Success");
    return true;
  } else {
    return false;
  }
}

Future<bool> productsDeleteRequest(id) async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/" + id);
  var response = await http.get(URL, headers: postHeader);
  if (response.statusCode == 200 &&
      json.decode(response.body)['status'] == "success") {
    successToast("Success");
    return true;
  } else {
    return false;
  }
}

void successToast(message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}
