import 'package:bookings/bindings/bookingbinding.dart';
import 'package:bookings/bindings/homebinding.dart';
import 'package:bookings/bindings/loginbinding.dart';
import 'package:bookings/bindings/pertemuanbinding.dart';
import 'package:bookings/bindings/sertifikatbinding.dart';
import 'package:bookings/pages/auth/login.dart';
import 'package:bookings/pages/auth/splash.dart';
import 'package:bookings/pages/home/booking.dart';
import 'package:bookings/pages/home/bookingjadwal.dart';
import 'package:bookings/pages/home/home.dart';
import 'package:bookings/pages/home/pertemuan.dart';
import 'package:bookings/pages/home/sertifikat.dart';
import 'package:bookings/routes/routename.dart';
import 'package:get/get.dart';

class RoutePage {
  static final route = [
    GetPage(
      name: RouteName.splash,
      page: () => const Splash(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => const Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouteName.booking,
      page: () => Booking(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: RouteName.sertifikat,
      page: () => const Sertifikat(),
      binding: Sertifikatbinding(),
    ),
    GetPage(
      name: RouteName.pertemuan,
      page: () => Pertemuan(),
      binding: PertemuanBinding(),
    ),
    GetPage(
      name: RouteName.bookingjadwal,
      page: () => Bookingjadwal(),
      binding: BookingBinding(),
    ),
  ];
}
