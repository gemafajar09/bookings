import 'package:bookings/controllers/page/pertemuancontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pertemuan extends StatelessWidget {
  Pertemuan({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 9.5,
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 4, 88, 156),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  child: const Stack(
                    children: [
                      Positioned(
                        top: 30,
                        left: 50,
                        child: Text(
                          "Pertemuan",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
