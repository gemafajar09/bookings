import 'package:bookings/controllers/auth/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Login extends GetView<LoginController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: Container(
            color: const Color.fromARGB(255, 238, 237, 237),
            child: Stack(
              children: [
                SizedBox(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1,
                            height: MediaQuery.of(context).size.height / 2.7,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 7, 66, 114),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                              ),
                            ),
                            child: Center(
                              child: Lottie.asset(
                                "assets/login.json",
                                width: MediaQuery.of(context).size.width / 2,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: controller.email,
                              decoration: InputDecoration(
                                hintText: "email",
                                labelText: "Email",
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 0, 51, 94),
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: controller.password,
                              obscureText: controller.hiddenPass.value,
                              decoration: InputDecoration(
                                labelText: "Password",
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.hiddenPass.toggle();
                                  },
                                  icon: controller.hiddenPass.value
                                      ? const Icon(
                                          Icons.remove_red_eye_outlined)
                                      : const Icon(
                                          Icons.remove_red_eye_rounded),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                          ),
                          CheckboxListTile(
                            activeColor: const Color.fromARGB(255, 34, 18, 175),
                            checkColor: Colors.white,
                            value: controller.rememberMe.value,
                            onChanged: (_) => controller.rememberMe.toggle(),
                            controlAffinity: ListTileControlAffinity.leading,
                            title: const Text("Ingatkan Saya.."),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 22,
                              right: 22,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Masuk",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 90, 89, 89),
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 7, 66, 114),
                                  child: IconButton(
                                    onPressed: () => controller.login(
                                      controller.email.text,
                                      controller.password.text,
                                      controller.rememberMe.value,
                                    ),
                                    icon: const Icon(Icons.arrow_right_alt),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 30,
                  left: 20,
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: Color.fromARGB(255, 250, 250, 253),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
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
