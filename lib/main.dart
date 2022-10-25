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
      themeMode: ThemeMode.dark,
       darkTheme: ThemeData.dark().copyWith(
        accentColor: Colors.green,
        primaryColor: Color(0xff141A31),
        primaryColorDark: Color(0xff081029),
        scaffoldBackgroundColor: Color(0xff141A31),
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.blue),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.green),
              padding: MaterialStateProperty.all(EdgeInsets.all(14))),
        ),
      ),
    ),
  );
}
