import 'dart:convert';

import 'package:bookings/service/config.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class Loginservice {
  final box = GetStorage();

  Future<dynamic> login(String email, String password) async {
    var body = {"email": email, "password": password};
    final res = await http.post(
      Uri.parse(Url.login), 
      body: body,
    );
    if (res.statusCode == 200) {
      return json.decode(res.body);
    } else {
      throw Exception("koneksi gagal");
    }
  }

}
