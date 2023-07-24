import 'package:bookings/controllers/page/pertemuancontroller.dart';
import 'package:get/get.dart';

class PertemuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PertemuanController>(() => PertemuanController());
  }
}
