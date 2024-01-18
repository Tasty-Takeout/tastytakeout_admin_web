import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tastytakeout_admin_web/globals.dart';
import 'package:tastytakeout_admin_web/models/dto/event_model.dart';

class EventSource {
  final baseUrl = Uri.http(serverIp, '/events/');
  String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxODg1OTUxNjI4LCJpYXQiOjE3MDQ1MTE2MjgsImp0aSI6IjU1MGFiOWU0MGM4MTQ2MDNhNmQxMjcxZjRiZjYxNmQ4IiwidXNlcl9pZCI6MTAsInJvbGUiOiJCVVlFUiJ9.Um--pPRWNG7VPh9F7ARYaRIn2Ab5yDvrpZvfsO9_9vA';

  Future<bool> createNewEvent(EventModel event) async {
    try {
      final uri = Uri.parse('$baseUrl');
      // final response = await http.get(uri);

      // convert event.vouchers to json maps that looks like 
      // {
      // "id": 0
      // }
      // {
      // "id": 2
      // }
      final List<Map<String, dynamic>> voucherMaps = []; 
      for (var voucherId in event.vouchers) {
        voucherMaps.add({
          'id': voucherId,
        });
      }
      
      String jsonString = jsonEncode(voucherMaps);
      print(jsonString);

      var body = jsonEncode({
        "vouchers": voucherMaps,
        'name': event.name,
        'description': event.description,
        'imageUrl': event.imageUrl,
    });

      final response = await http.post(
        uri,
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization' : 'Bearer ' + token
        },
        body: body,

      );

      if (response.statusCode == 201) {
        // If the server did return a 201 OK response,
        return Future<bool>.value(true);
      } else {
        // Error handling for unsuccessful requests
        print('Request failed with status: ${response.statusCode}');
        print(response.body);
        return Future<bool>.value(false);
      }
    } catch (e) {
      // Exception handling
      print('Exception during request: $e');
      return Future<bool>.value(false);
    }
  }
}