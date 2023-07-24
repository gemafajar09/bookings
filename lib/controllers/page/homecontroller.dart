import 'package:bookings/models/bannerm.dart';
import 'package:bookings/models/mentor.dart';
import 'package:bookings/routes/routename.dart';
import 'package:bookings/service/homeservice.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  var mentor = <Mentor>[].obs;
  var banner = <Bannerm>[].obs;
  var nilai = 3.obs;
  var nama = ''.obs;
  final isLoading = false.obs;

  var homenservice = HomeService();

  @override
  void onInit() async {
    super.onInit();

    await GetStorage.init();

    final box = GetStorage();
    final data = box.read('dataUser') as Map<String, dynamic>;
    if (box.read('dataUser') != null) {
      nama.value = data['nama'];
    } else {
      nama.value = '';
      Get.offNamed(RouteName.login);
    }
    getMentor();
    getBanner();
    print(data);
  }

  void getMentor() async {
    try {
      isLoading.value = true;
      var mentors = await homenservice.mentor();
      mentors.forEach((item) {
        mentor.add(Mentor.fromJson(item));
      });

      isLoading.value = false;
    } catch (err) {
      Get.defaultDialog(
        title: "Error",
        middleText: err.toString(),
      );
    }
  }

  void getBanner() async {
    try {
      isLoading.value = true;
      var banners = await homenservice.getbanner();
      banners.forEach((item) {
        banner.add(Bannerm.fromJson(item));
      });

      isLoading.value = false;
    } catch (err) {
      Get.defaultDialog(
        title: "Error",
        middleText: err.toString(),
      );
    }
  }
}
