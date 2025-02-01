// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future<int> calculateTotalPrice(
    List<dynamic> selectedTickets, List<dynamic> specialTickets) async {
  int totalPrice = 0;

  if (selectedTickets.isNotEmpty) {
    for (var item in selectedTickets) {
      if (item is Map<String, dynamic> &&
          item.containsKey('price') &&
          item.containsKey('quantity')) {
        totalPrice +=
            ((item['price'] ?? 0) as int) * ((item['quantity'] ?? 0) as int);
      }
    }
  }

  if (specialTickets.isNotEmpty) {
    for (var item in specialTickets) {
      if (item is Map<String, dynamic> &&
          item.containsKey('price') &&
          item.containsKey('quantity')) {
        totalPrice +=
            ((item['price'] ?? 0) as int) * ((item['quantity'] ?? 0) as int);
      }
    }
  }

  return totalPrice;
}
