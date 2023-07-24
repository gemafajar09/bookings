import 'package:bookings/models/jadwalles.dart';
import 'package:bookings/models/kelasuser.dart';
import 'package:bookings/models/mentor.dart';
import 'package:bookings/routes/routename.dart';
import 'package:bookings/service/homeservice.dart';
import 'package:bookings/service/jadwallesservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BookingController extends GetxController {
  var jadwal = <Jadwalles>[].obs;
  var mentor = <Mentor>[].obs;
  var kelasuser = <Kelasuser>[].obs;
  var id = ''.obs;
  var isLoading = false.obs;

  var jambooking = [
    '09:00',
    '09:30',
    '10:00',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00'
  ];

  var jams = '09:00'.obs;
  var idmentor = '1'.obs;
  var kelasu = '0'.obs;

  var jadwals = JadwallesService();
  var homenservice = HomeService();

  late TextEditingController tanggals;

  @override
  void onInit() async {
    super.onInit();
    tanggals = TextEditingController();
    tanggals.clear();
    jams.value = '09:00';
    await GetStorage.init();
    kelasu.value = kelasuser[0].idKelas.toString();
    idmentor.value = mentor[0].idMentor.toString();
    final box = GetStorage();
    final data = box.read('dataUser') as Map<String, dynamic>;

    id.value = data['id'];
    getMentor();
    getJadwal(data['id'].toString());
    getKelas(data['id'].toString());

  }

  void refresh() async{
    jadwal.value = [];
    mentor.value = [];
    kelasuser.value = [];
    final box = await GetStorage();
    final data = box.read('dataUser') as Map<String, dynamic>;

    id.value = data['id'];
    getMentor();
    getJadwal(data['id'].toString());
    getKelas(data['id'].toString());
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

  void getKelas(id) async {
    try {
      isLoading.value = true;
      var users = await jadwals.getkelas(id);
      users.forEach((item) {
        kelasuser.add(Kelasuser.fromJson(item));
      });

      isLoading.value = false;
    } catch (err) {
      Get.defaultDialog(
        title: "Error",
        middleText: err.toString(),
      );
    }
  }

  void changeTime(String val) {
    jams.value = val.toString();
  }

  void changeMentor(String val){
    idmentor.value = val.toString();
  }

  void changeKelas(String val){
    kelasu.value = val;
  }

  void getJadwal(id) async {
    try {
      isLoading.value = true;
      var banners = await jadwals.getjadwal(id);
      banners.forEach((item) {
        jadwal.add(Jadwalles.fromJson(item));
      });

      isLoading.value = false;
    } catch (err) {
      Get.defaultDialog(
        title: "Error",
        middleText: err.toString(),
      );
    }
  }

  void booking(id, tanggal, jam, kelas, mentor) async {
    try {
      var hasil = await jadwals.bookingjdwl(id, tanggal, jam, kelas, mentor);

      if (hasil['pesan']) {
        tanggals.clear();
        jams.value = '09:00';
        Get.offNamed(RouteName.home);
      } else {
        Get.back();
      }
    } catch (err) {
      Get.defaultDialog(
        title: "Error",
        middleText: err.toString(),
      );
    }
  }

}

