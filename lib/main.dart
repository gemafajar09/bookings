import 'package:bookings/routes/routename.dart';
import 'package:bookings/routes/routepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouteName.splash,
      getPages: RoutePage.route,
      debugShowCheckedModeBanner: false,
    );
  }
}
