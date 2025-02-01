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

Future<void> updateSelectedTickets(
    String ticketName, int ticketPrice, bool isAdding) async {
  FFAppState ffAppState = FFAppState();

  ffAppState.update(() {
    int index =
        ffAppState.selectedTickets.indexWhere((t) => t['name'] == ticketName);

    if (isAdding) {
      // إذا لم تكن التذكرة موجودة، أضفها إلى القائمة
      if (index == -1) {
        ffAppState.selectedTickets
            .add({"name": ticketName, "price": ticketPrice, "quantity": 1});
      } else {
        // إذا كانت التذكرة موجودة، قم بزيادة العدد
        ffAppState.selectedTickets[index]['quantity'] += 1;
      }
    } else {
      // تقليل العدد، ولكن لا تدعه يصل إلى أقل من 0
      if (index != -1 && ffAppState.selectedTickets[index]['quantity'] > 0) {
        ffAppState.selectedTickets[index]['quantity'] -= 1;

        // إذا وصلت الكمية إلى 0، احذف التذكرة من القائمة
        if (ffAppState.selectedTickets[index]['quantity'] == 0) {
          ffAppState.selectedTickets.removeAt(index);
        }
      }
    }
  });
}
