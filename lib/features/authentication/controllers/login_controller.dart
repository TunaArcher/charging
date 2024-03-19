import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

import '../../../utils/popups/loaders.dart';
import '../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  // final hidePassword = true.obs;
  // final rememberMe = false.obs;
  final localStorage = GetStorage();
  final phone = TextEditingController();
  final password = TextEditingController();

  // final userController = Get.put(UserController());
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    // password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// -- Phone and Password SignIn
  Future<void> phoneAndPasswordSignIn() async {
    try {
      // Start Loading
      // TFullScreenLoader.openLoadingDialog(
      //     'Logging you in...', TImages.docerAnimation);

      // Check Internet Connectivity
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   TFullScreenLoader.stopLoading();
      //   return;
      // }
      //
      // // Form Validation
      // if (!loginFormKey.currentState!.validate()) {
      //   TFullScreenLoader.stopLoading();
      //   return;
      // }

      // Save Data if Remember Me is selected
      // if (rememberMe.value) {
      //   localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      //   localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      // }

      // Login user using EMail & Password Authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithPhoneAndPassword(phone.text.trim(), password.text.trim());

      // Assign user data to RxUser of UserController to use in app
      // await userController.fetchUserRecord();

      // Remove Loader
      // TFullScreenLoader.stopLoading();

      // Redirect
      await AuthenticationRepository.instance.screenRedirect(userCredentials);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
