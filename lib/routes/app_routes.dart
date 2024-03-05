import 'package:get/get.dart';

import 'routes.dart';

import '../features/authentication/screens/signinsignup/signtab.dart';
import '../features/bookings/screens/bookings/booking_screen.dart';
import '../features/explore/screens/explore/explore_screen.dart';
import '../features/nearby/screens/nearby/nearby_screen.dart';
import '../features/profile/screens/profile/profile_screen.dart';
import '../features/scan/screens/scan/scan_screen.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.signtab, page: () => const SignTab()),
    GetPage(name: TRoutes.explore, page: () => const ExploreScreen()),
    GetPage(name: TRoutes.nearby, page: () => const NearbyScreen()),
    GetPage(name: TRoutes.scan, page: () => const ScanScreen()),
    GetPage(name: TRoutes.booking, page: () => const BookingScreen()),
    GetPage(name: TRoutes.profile, page: () => const ProfileScreen()),
  ];
}
