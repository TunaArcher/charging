import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'data/repositories/authentication/authentication_repository.dart';

import 'package:charging/app.dart';

void main() async {
  // Widgets Binding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Init Local Storage
  await GetStorage.init();

  // Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // TODO:: Initialize DB
  await Future.delayed(Duration(seconds: 5));
  FlutterNativeSplash.remove();

  // TODO:: Initialize Authentication
  Get.put(AuthenticationRepository());

  runApp(const App());
}
