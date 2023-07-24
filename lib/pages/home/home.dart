import 'package:bookings/controllers/page/homecontroller.dart';
import 'package:bookings/controllers/page/scanqrcontroller.dart';
import 'package:bookings/models/mentor.dart';
import 'package:bookings/routes/routename.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final homeC = Get.find<HomeController>();
  final qrC = Get.find<ScanqrController>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1,
            child: Obx(
              () => Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 7.9,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 4, 88, 156),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                maxRadius: 23,
                                backgroundColor:
                                    Color.fromARGB(255, 250, 249, 248),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Selamat Datang",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "${homeC.nama}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: CircleAvatar(
                            child: IconButton(
                              onPressed: () {
                                qrC.scanqr();
                              },
                              icon: const Icon(
                                Icons.qr_code,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // content
                  Positioned(
                    top: MediaQuery.of(context).size.height / 8.5,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1,
                      height: MediaQuery.of(context).size.height / 1,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 254, 254),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                            ),
                            items: homeC.banner
                                .map(
                                  (item) => bannerList(item.gambar, size),
                                )
                                .toList(),
                          ),
                          // menu list
                          menuList(),
                          const SizedBox(
                            height: 20,
                          ),
                          // name mentor
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 5.0, left: 22, right: 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Mentor",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text("Show All"),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(Icons.arrow_circle_right),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 2.6,
                            margin: const EdgeInsets.only(left: 10),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: homeC.mentor.length,
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                return listData(homeC.mentor[i], size);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget listData(Mentor mentor, size) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 35),
          child: Container(
            height: size.height / 3,
            width: size.width / 2.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 15,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${mentor.namaMentor.toString()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "${mentor.bidang.toString()}",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 20,
          right: 0,
          child: Container(
            height: size.height / 3.3,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: NetworkImage(
                    "https://media.discordapp.net/attachments/1113425752214478868/1116213174778216478/image-removebg-preview.png?width=370&height=468"),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget menuList() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(RouteName.booking);
                },
                child: Container(
                  height: 80,
                  width: 120,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 9, 209, 36),
                        Color.fromARGB(255, 19, 145, 35),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.auto_stories_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        "Booking",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteName.pertemuan);
                },
                child: Container(
                  height: 80,
                  width: 120,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 82, 93, 241),
                        Color.fromARGB(255, 45, 55, 182),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.auto_stories_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        "Pertemuan",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(RouteName.sertifikat);
            },
            child: Container(
              height: 165,
              width: 200,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 91, 20, 224),
                    Color.fromARGB(255, 60, 13, 148),
                  ],
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.badge_outlined,
                    color: Colors.white,
                    size: 60,
                  ),
                  Text(
                    "Sertifikat",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bannerList(banner, size) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: size.height / 5,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage("$banner"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
