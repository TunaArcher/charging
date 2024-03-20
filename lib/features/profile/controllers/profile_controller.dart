import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/widgets/loaders/circular_loader.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

import '../../../utils/popups/loaders.dart';
import '../../personalization/controllers/user_controller.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  /// Logout Loader Function
  Future<void> logout() async {
    try {
      // Start Loading
      EvxFullScreenLoader.openLoadingDialog('Logout you in...', EvxImages.docerAnimation);

      // Logout
      await AuthenticationRepository.instance.logout();

      // Remove Loader
      EvxFullScreenLoader.stopLoading();

      // Redirect
      await AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      EvxFullScreenLoader.stopLoading();
      EvxLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
