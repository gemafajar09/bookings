import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Sertifikat extends StatelessWidget {
  const Sertifikat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 7.8,
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 7, 44, 143),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
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
                          "Sertifikat",
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
