import 'package:bookings/controllers/page/sertifikatcontroller.dart';
import 'package:get/get.dart';

class Sertifikatbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SertifikatConroller>(() => SertifikatConroller());
  }
}
