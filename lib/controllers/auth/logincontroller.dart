
import 'package:bookings/routes/routename.dart';
import 'package:bookings/service/loginservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var hiddenPass = true.obs;
  var rememberMe = false.obs;
  var isEmail = false.obs;
  var isPassword = false.obs;
  var isAuth = false;
  var id = ''.obs;

  final loginservice = Loginservice();
  late TextEditingController email;
  late TextEditingController password;

  void dialog(type, msg) {
    Get.defaultDialog(
      backgroundColor: const Color.fromARGB(255, 145, 145, 145),
      title: type,
      middleText: msg,
    );
  }

  @override
  void onInit() async {
    email = TextEditingController();
    password = TextEditingController();

    await GetStorage.init();

    final box = GetStorage();

    final data = box.read('dataUser') as Map<String, dynamic>;
    if (box.read('dataUser') != null) {
       id.value = data['id'];
       email.text = data['email'];
       password.text = data['password'];
       rememberMe.value = data['remember'];

 // autoLogin();
    }

    if (isAuth) {
      Get.toNamed(RouteName.home);
    }
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();

    email.clear();
    password.clear();
  }

  void login(String email, String password, bool remember) async {
    if (email.isEmpty) {
      isEmail.toggle();
      dialog("error", "email kosong");
    } else if (!email.contains("@")) {
      isEmail.toggle();
      dialog("error", "pastikan email benar");
    }

    if (password.isEmpty) {
      isPassword.toggle();
      dialog("error", "Password kosong");
    }

    var data = await loginservice.login(email, password);
    if (data['success']) {
      isAuth = true;

      Get.offNamed(RouteName.home);
    } else {
      dialog("error", "Password kosong");
    }

    final insert = GetStorage();
    insert.write('dataUser', {
      'id' : data['data']['id'].toString(),
      'nama' : data['data']['nama'],
      'token': data['data']['token'],
      'email': email,
      'password': password,
      'remember': remember,
    });
  }

  void autoLogin() {
    final box = GetStorage();
    final data = box.read("dataUser") as Map<String, dynamic>;
    if (box.read('dataUser') != null && data['token'] != null) {
      login(data['email'], data['password'], data['remember']);
    }
  }
}
