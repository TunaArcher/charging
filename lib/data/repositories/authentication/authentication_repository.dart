import 'dart:convert';

import 'package:charging/utils/constants/api_constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../features/authentication/screens/signinsignup/signtab.dart';
import '../../../features/personalization/models/user_model.dart';
import '../../../home_menu.dart';
import '../../../utils/http/http_client.dart';
import '../../../utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  late UserModel user;

  // late final Rx<User?> _firebaseUser;
  // final _auth = FirebaseAuth.instance;

  /// Getters
  // User? get firebaseUser => _firebaseUser.value;

  // String get getUserID => _firebaseUser.value?.uid ?? "";
  //
  // String get getUserEmail => _firebaseUser.value?.email ?? "";
  //
  // String get getDisplayName => _firebaseUser.value?.displayName ?? "";
  //
  // String get getPhoneNo => _firebaseUser.value?.phoneNumber ?? "";

  /// Called from main.dart on app launch
  @override
  void onReady() {
    // _firebaseUser = Rx<User?>(_auth.currentUser);
    // _firebaseUser.bindStream(_auth.userChanges());
    // FlutterNativeSplash.remove();
    // screenRedirect(_firebaseUser.value);
  }

  /// Function to Show Relevant Screen
  screenRedirect(UserModel? user) async {
    if (user != null) {
      // User Logged-In: If email verified let the user go to Home Screen else to the Email Verification Screen
      // if (user.emailVerified) {
      //   // Initialize User Specific Storage
      //   await EvxLocalStorage.init(user.uid);
      //   Get.offAll(() => const HomeMenu());
      // } else {
      //   Get.offAll(() => VerifyEmailScreen(email: getUserEmail));
      // }

      String? token = user.token;

      await EvxLocalStorage.init(token!);
      Get.offAll(() => const HomeMenu());
    } else {
      // Local Storage: User is new or Logged out! If new then write isFirstTime Local storage variable = true.
      // deviceStorage.writeIfNull('isFirstTime', true);
      // deviceStorage.read('isFirstTime') != true
      //     ? Get.offAll(() => const LoginScreen())
      //     : Get.offAll(() => const OnBoardingScreen());

      Get.offAll(() => const SignTab());
    }
  }

  /* ---------------------------- Phone & Password sign-in ---------------------------------*/

  /// [PhoneAuthentication] - SignIn
  Future loginWithPhoneAndPassword(String phone, String password) async {
    try {
      // dynamic data = {
      //   'phone': phone,
      //   'password': password
      // };

      dynamic data = {'phone': '000000000', 'password': '1234test'}; // ยูสนี้มีอยู่ใน DATABASE อยู่แล้ว

      var response = await EvxHttpHelper.post(evxLogin, data);

      return UserModel.fromJson(response['data']);
    } catch (e) {
      // TODO:: Handle
    }
  }

  /// [PhoneAuthentication] - REGISTER
  // Future<UserCredential> registerWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     return await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //   } catch (e) {
  //     // TODO:: Handle
  //   }
  // }

  /* ---------------------------- Federated identity & social sign-in ---------------------------------*/

  // TODO:: Handle

  /* ---------------------------- ./end Federated identity & social sign-in ---------------------------------*/

  /// [LogoutUser] - Valid for any authentication.
  Future<void> logout() async {
    try {
      // await GoogleSignIn().signOut();
      // await FacebookAuth.instance.logOut();
      // await FirebaseAuth.instance.signOut();

      // TODO:: Handle

      Get.offAll(() => const SignTab());
    } catch (e) {
      // TODO:: Handle
    }
  }
}
