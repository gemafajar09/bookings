import 'package:bookings/controllers/page/bookingcontroller.dart';
import 'package:bookings/models/jadwalles.dart';
import 'package:bookings/routes/routename.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Booking extends StatelessWidget {
  Booking({super.key});
  final bookingC = Get.find<BookingController>();

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    bookingC.refresh();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidPullToRefresh(// key if you want to add
        onRefresh: _handleRefresh,
        borderWidth: 5,
        height: MediaQuery.of(context).size.height / 4,
        color: Colors.transparent,
        backgroundColor: Color.fromARGB(255, 4, 88, 156),
        showChildOpacityTransition: false,
        animSpeedFactor: 10,
        springAnimationDurationInMilliseconds: 200,
        child: SafeArea(
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
                            "Booking",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Container(
                      height: MediaQuery.of(context).size.height / 1,
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 10,
                      ),
                      child: ListView.builder(
                        itemCount: bookingC.jadwal.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, i) {
                          return datalist(bookingC.jadwal[i], i);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Get.toNamed(RouteName.bookingjadwal);
        },
      ),
    );
  }

  Widget inputForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Center(
          child: Text(
            "Buat Jadwal",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Divider(
          color: Colors.black,
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Tanggal",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        const TextField(
          keyboardType: TextInputType.text,
          maxLines: 1,
          decoration: InputDecoration(
            labelText: 'Tanggal',
            hintMaxLines: 1,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 4.0),
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text("Simpan"),
        ),
      ],
    );
  }

  Widget datalist(Jadwalles data, int index) {
    return Stack(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: data.status == 'ditolak'
                ? Colors.red
                : data.status == 'pending'
                ? Colors.yellow
                : Colors.green,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Container(
          height: 80,
          margin: const EdgeInsets.only(
            left: 5,
            bottom: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: data.status == 'ditolak'
                  ? Colors.red
                  : data.status == 'pending'
                  ? Colors.yellow
                  : Colors.green,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${data.materi}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${data.jenis}",
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Mentor : ${data.namaMentor}",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 151, 147, 147),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${data.jam} WIB",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${data.tanggal}",
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 25,
                  width: 100,
                  decoration: BoxDecoration(
                    color: data.status == 'ditolak'
                        ? Colors.red
                        : data.status == 'pending'
                        ? Colors.yellow
                        : Colors.green,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "${data.status}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
