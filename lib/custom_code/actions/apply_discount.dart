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
Future<int> applyDiscount(String ticketId, int price, bool isAdding) async {
  int totalPrice = 0;

  FFAppState().update(() {
    List<dynamic> currentTickets = FFAppState().specialTickets;

    // البحث عن التذكرة في القائمة باستخدام ticketId
    int existingIndex =
        currentTickets.indexWhere((ticket) => ticket['ticketId'] == ticketId);

    if (existingIndex != -1) {
      if (isAdding) {
        // تحديث السعر فقط إذا كانت التذكرة موجودة
        currentTickets[existingIndex]['price'] = price;
      } else {
        // إزالة التذكرة إذا كانت موجودة
        currentTickets.removeAt(existingIndex);
      }
    } else if (isAdding) {
      // إذا لم تكن التذكرة موجودة، نقوم بإضافتها
      Map<String, dynamic> newTicket = {
        'ticketId': ticketId,
        'price': price,
      };
      currentTickets.add(newTicket);
    }

    // تحديث `specialTickets` في `FFAppState`
    FFAppState().specialTickets = List.from(currentTickets);
  });

  // التأكد من أن `calculateTotalPrice` ليس فارغًا ويأخذ المعاملات المطلوبة
  if (calculateTotalPrice != null) {
    totalPrice = await calculateTotalPrice(
      FFAppState().selectedTickets,
      FFAppState().specialTickets,
    );
  } else {
    totalPrice = 0;
  }

  // تحديث `totalPrice` في `FFAppState`
  FFAppState().update(() {
    FFAppState().totalPrice = totalPrice;
  });

  return totalPrice;
}
