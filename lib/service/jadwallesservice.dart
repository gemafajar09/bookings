import 'dart:convert';

import 'package:bookings/service/config.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class JadwallesService {
  static var client = http.Client();
  final box = GetStorage();

  Future<dynamic> getjadwal(String id) async {
    final user = box.read('dataUser') as Map<String, dynamic>;
    final data = await client.get(Uri.parse("${Url.jadwalles}/$id"),headers: {
      'Content-type': 'application/json',
      'Authorization'  : 'Bearer ${user['token']}'
    });
    if (data.statusCode == 200) {
      return json.decode(data.body);
    } else {
      throw Exception("data jam error");
    }
  }

  Future<dynamic> getkelas(String id) async {
    final user = box.read('dataUser') as Map<String, dynamic>;
    final data = await client.get(Uri.parse("${Url.kelasuser}/$id"),headers: {
      'Content-type': 'application/json',
      'Authorization'  : 'Bearer ${user['token']}'
    });

    if (data.statusCode == 200) {
      return json.decode(data.body);
    } else {
      throw Exception("data kelas error");
    }
  }

  Future<dynamic> bookingjdwl(String id, String tanggal, String jam, String kelas, String mentor) async {
    final user = box.read('dataUser') as Map<String, dynamic>;
    var body = json.encode({"id": id, "tanggal": tanggal, "jam": jam, "kelas" : kelas, "id_mentor" : mentor});

    final res = await http.post(Uri.parse(Url.bookingjadwal),
        body: body,
        headers: {
          'Content-type': 'application/json',
          'Authorization'  : 'Bearer ${user['token']}'
        });
    if (res.statusCode == 200) {
      return json.decode(res.body);
    } else {
      throw Exception("koneksi booking jadwal gagal");
    }
  }


}
