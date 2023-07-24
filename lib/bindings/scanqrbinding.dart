import 'package:bookings/controllers/page/scanqrcontroller.dart';
import 'package:get/get.dart';

class ScanqrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanqrController>(() => ScanqrController());
  }
}
