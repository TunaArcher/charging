import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'utils/color.dart';

import 'package:charging/features/bookings/screens/bookings/booking_screen.dart';
import 'package:charging/features/explore/screens/explore/explore_screen.dart';
import 'package:charging/features/nearby/screens/nearby/nearby_screen.dart';
import 'package:charging/features/profile/screens/profile/profile_screen.dart';
import 'package:charging/features/scan/screens/scan/scan_screen.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppScreenController());

    return Scaffold(
      extendBody: true,
      body: Obx(() => controller.screens[controller.selectedMenu.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          animationDuration: const Duration(seconds: 3),
          selectedIndex: controller.selectedMenu.value,
          backgroundColor: darkPrimeryColor,
          elevation: 0,
          indicatorColor: darkPrimeryColor,
          onDestinationSelected: (index) =>
              controller.selectedMenu.value = index,
          destinations: const [
            NavigationDestination(
                icon: Image(
                  image: AssetImage('assets/icons/House, home, hut.png'),
                  height: 30,
                ),
                label: 'Explore'),
            NavigationDestination(
                icon: Image(
                  image:
                      AssetImage('assets/icons/Explore, compass, discover.png'),
                  height: 30,
                ),
                label: 'Nearby'),
            NavigationDestination(
                icon: Image(
                  image: AssetImage('assets/icons/QR, code, scan.png'),
                  height: 30,
                ),
                label: 'EVX'),
            NavigationDestination(
                icon: Image(
                  image:
                      AssetImage('assets/icons/Battery, charging, power.png'),
                  height: 30,
                ),
                label: 'Bookings'),
            NavigationDestination(
                icon: Image(
                  image: AssetImage(
                      'assets/icons/user, person, profile, block, account, circle.png'),
                  height: 30,
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class AppScreenController extends GetxController {
  static AppScreenController get instance => Get.find();
  final Rx<int> selectedMenu = 0.obs;
  final screens = [
    const ExploreScreen(),
    const NearbyScreen(),
    const ScanScreen(),
    const BookingScreen(),
    const ProfileScreen(),
  ];
}
