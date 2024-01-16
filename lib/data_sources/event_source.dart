import 'package:http/http.dart' as http;
import 'package:tastytakeout_admin_web/globals.dart';
import 'package:tastytakeout_admin_web/models/dto/event_model.dart';

class EventSource {
  final baseUrl = Uri.http(serverIp, '/events/');

  Future<bool> createNewEvent(EventModel voucher) async {
    try {
      final uri = Uri.parse('$baseUrl');
      // final response = await http.get(uri);
      final response = await http.post(
        uri,
        headers: {
          'accept': 'application/json',
        },
        body: {
          'name': voucher.name,
          'description': voucher.description,
          'imageUrl': voucher.imageUrl,
          // 'vouchers': voucher.vouchers.toString(),
        },

      );

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
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