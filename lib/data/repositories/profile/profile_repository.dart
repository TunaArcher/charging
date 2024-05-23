import 'package:charging/features/authentication/models/auth_model.dart';
import 'package:charging/features/personalization/models/user_model.dart';
import 'package:charging/utils/constants/api_constants.dart';
import 'package:charging/utils/http/http_client.dart';
import 'package:get/get.dart';

class ProfileRepository extends GetxController {
  static ProfileRepository get instance => Get.find();
  late UserModel user;

  /// [] - Update Profile
  Future updateProfileById(
      String id, String name, String lasename, String email, String tel) async {
        
    try {
      dynamic data = {
        'id': id,
        'firstname': name,
        'lastname': lasename,
        'email': email,
        'phone': tel
      };

      // print(data);

      var response = await EvxHttpHelper.post(evxUpdateProfile, data);

      var profileResponse = AuthModel.fromJson(response['data']);

      return profileResponse;
    } catch (e) {
      // TODO:: Handle
    }
  }
}
