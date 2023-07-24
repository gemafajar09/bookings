import 'dart:async';

import 'package:bookings/routes/routename.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(
          seconds: 5,
        ), () {
      Get.offNamed(RouteName.login);
    });
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 1,
        child: Center(
          child: Container(
            width: 180,
            height: 180,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/md.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
