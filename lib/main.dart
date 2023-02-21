import 'package:app_movies/application/bindings/application_binding.dart';
import 'package:app_movies/modules/home/home_module.dart';
import 'package:app_movies/modules/login/login_module.dart';
import 'package:app_movies/modules/splash/splash_module.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'application/ui/app_movies_ui_config.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppMoviesUiConfig.title,
      theme: AppMoviesUiConfig.theme,
      initialBinding: ApplicationBinding(),
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
      ],
    );
  }
}
