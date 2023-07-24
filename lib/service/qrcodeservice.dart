import 'dart:convert';

import 'package:bookings/service/config.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class Qrcodeservice {
  static var client = http.Client();
  final box = GetStorage();
  Future<dynamic> absensiqr(String id, String qr) async {
    final user = box.read('dataUser') as Map<String, dynamic>;
    if(qr == 'absensi'){
      final res = await http.get(Uri.parse("${Url.absensi}/$id"),headers: {
        'Content-type': 'application/json',
        'Authorization'  : 'Bearer ${user['token']}'
      });

      if (res.statusCode == 200) {
        return json.decode(res.body);
      } else {
        throw Exception("koneksi gagal");
      }
    }

  }
}
