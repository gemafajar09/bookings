import 'package:bookings/service/qrcodeservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScanqrController extends GetxController {
  String qrCode = '';

  var id = ''.obs;

  var homenservice = Qrcodeservice();

  @override
  void onInit() async {
    super.onInit();

    await GetStorage.init();

    final box = GetStorage();
    if (box.read('dataUser') != null) {
      final data = box.read('dataUser') as Map<String, dynamic>;
      id.value = data['id'].toString();
    } else {
      id.value = '';
    }
  }

  void dialog(type, msg) {
    Get.defaultDialog(
      backgroundColor: const Color.fromARGB(255, 145, 145, 145),
      title: type,
      middleText: msg,
    );
  }

  Future<void> scanqr() async {
    try {
      qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        false,
        ScanMode.QR,
      );
      print("iko qr code cok $qrCode");
      var data = await homenservice.absensiqr(id.value,qrCode);
      if (data['pesan']) {
        Get.back();
      }else{
        dialog("error", "QR tidak ditemukan");
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
