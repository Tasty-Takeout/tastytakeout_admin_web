import 'dart:convert';

import 'package:tastytakeout_admin_web/globals.dart';
import 'package:http/http.dart' as http;
import 'package:tastytakeout_admin_web/models/dto/voucher_model.dart';

class VoucherSource {
  final baseUrl = Uri.http(serverIp, '/vouchers/');

  Future<bool> createNewVoucher(VoucherModel voucher) async {
    try {
      final uri = Uri.parse('$baseUrl');
      final response = await http.post(
        uri,
        headers: {
          'accept': 'application/json',
        },
        body: {
          'code': voucher.code,
          'name': voucher.name,
          'description': voucher.description,
          'end': voucher.endDate,
          'discount_amount': voucher.discountAmount.toString(),
          'discount_type': voucher.discountType,
          'max_price': voucher.maxPrice.toString(),
          'min_price': voucher.minPrice.toString(),
        },
      );

      if (response.statusCode == 200) {
        return Future<bool>.value(true);
      } else {
        print('Request failed with status: ${response.statusCode}');
        print(response.body);
        return Future<bool>.value(false);
      }
    } catch (e) {
      print('Exception during request: $e');
      return Future<bool>.value(false);
    }
  }

  Future<List<VoucherModel>> getAllVouchers() async {
    try {
      final uri = Uri.parse('$baseUrl');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        var jsonString = utf8.decode(response.bodyBytes);
        print(jsonString);
        final List<dynamic> data = jsonDecode(jsonString);

        final List<VoucherModel> vouchers = data
            .map((voucher) => VoucherModel.fromJson(voucher))
            .toList();
        return vouchers;
      } else {
        print('Request failed with status: ${response.statusCode}');
        print(response.body);
        return [];
      }
    } catch (e) {
      print('Exception during request: $e');
      return [];
    }
  }
}
