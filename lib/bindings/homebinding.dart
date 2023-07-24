import 'package:bookings/controllers/page/homecontroller.dart';
import 'package:bookings/controllers/page/scanqrcontroller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ScanqrController>(() => ScanqrController());
  }
}
