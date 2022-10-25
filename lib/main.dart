import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:makebetter_test/app/modules/splash/bindings/splash_binding.dart';

import 'app/routes/app_pages.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:health/health.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await Permission.activityRecognition.request();
 // SplashBinding().dependencies();
  
  runApp(
    GetMaterialApp(
      title: "makebetter_test",
      debugShowCheckedModeBanner: false,

      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: SplashBinding(),
    ),
  );
}
