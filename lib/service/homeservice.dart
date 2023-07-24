import 'dart:convert';

import 'package:bookings/service/config.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HomeService {
  static var client = http.Client();
  final box = GetStorage();

  Future<dynamic> mentor() async {
    final user = box.read('dataUser') as Map<String, dynamic>;
    final data = await client.get(Uri.parse(Url.mentor), headers: {
      'Content-type': 'application/json', 
      'Authorization'  : 'Bearer ${user['token']}'
    });
    if (data.statusCode == 200) {
      return json.decode(data.body);
    } else {
      throw Exception("data mentor error");
    }
  }

  Future<dynamic> getbanner() async {
    final user = box.read('dataUser') as Map<String, dynamic>;
    final data = await client.get(Uri.parse(Url.banner), headers: {
      'Content-type': 'application/json',
      'Authorization'  : 'Bearer ${user['token']}'
    });
    if (data.statusCode == 200) {
      return json.decode(data.body);
    } else {
      throw Exception("data banner error");
    }
  }

}
