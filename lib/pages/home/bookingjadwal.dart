import 'package:bookings/controllers/page/bookingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Bookingjadwal extends StatelessWidget {
  Bookingjadwal({super.key});
  final bookingC = Get.find<BookingController>();
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
                    color: Color.fromARGB(255, 4, 88, 156),
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
                          "Booking Jadwal",
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
                    height: MediaQuery.of(context).size.height / 1.2,
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                          height: 14,
                        ),
                        TextField(
                          controller: bookingC.tanggals,
                          maxLines: 1,
                          decoration: const InputDecoration(
                            labelText: 'Tanggal',
                            hintMaxLines: 1,
                            suffixIcon: Icon(
                              Icons.date_range,
                              color: Color.fromARGB(255, 110, 108, 108),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.green, width: 4.0),
                            ),
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );

                            if (pickedDate != null) {
                              String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                              bookingC.tanggals.text = formattedDate.toString();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const Text(
                          "Jam",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 14.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                value: bookingC.jams.value,
                                items: bookingC.jambooking.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  bookingC.changeTime(value.toString());
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const Text(
                          "Kelas",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 14.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                value: bookingC.kelasu.value,
                                items: bookingC.kelasuser.map((e) {
                                  return DropdownMenuItem(
                                    value: e.idKelas.toString(),
                                    child: Text(e.materi.toString()),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  bookingC.changeKelas(value.toString());
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const Text(
                          "Mentor",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 14.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                value: bookingC.idmentor.value,
                                items: bookingC.mentor.map((e) {
                                  return DropdownMenuItem(
                                    value: e.idMentor.toString(),
                                    child: Text(e.namaMentor.toString()),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  bookingC.changeMentor(value.toString());
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                            const Color.fromARGB(255, 4, 88, 156),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (bookingC.tanggals.text.isEmpty) {
                              Get.defaultDialog(
                                title: "Error",
                                middleText: "Pastikan data terisi.!",
                              );
                            } else {
                              bookingC.booking(
                                  bookingC.id.toString(),
                                  bookingC.tanggals.text.toString(),
                                  bookingC.jams.value.toString(),
                                  bookingC.kelasu.value,
                                  bookingC.idmentor.value.toString());
                            }
                          },
                          child: const Text("Simpan"),
                        ),
                      ],
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