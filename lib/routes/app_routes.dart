import 'package:get/get.dart';

import '../features/authentication/screens/signinsignup/signtab.dart';
import '../features/history/screens/history/history_screen.dart';
import '../features/home/screens/nearby/home_screen.dart';
import '../features/profile/screens/profile/profile_screen.dart';
import '../features/scan/screens/scan/scan_screen.dart';
import '../features/wallet/screens/wallet/wallet_screen.dart';

import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.signtab, page: () => const SignTab()),
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.history, page: () => const HistoryScreen()),
    GetPage(name: TRoutes.scan, page: () => const ScanScreen()),
    GetPage(name: TRoutes.wallet, page: () => const WalletScreen()),
    GetPage(name: TRoutes.profile, page: () => const ProfileScreen()),
  ];
}
