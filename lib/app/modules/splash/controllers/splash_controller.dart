import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  late GoogleSignIn googleSign;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    googleSign = GoogleSignIn();
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });

    super.onReady();
  }
@override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  

  void handleAuthStateChanged(isLoggedIn) async{
    await Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        if (isLoggedIn) {
          Get.offAllNamed(Routes.HOME, arguments: firebaseAuth.currentUser);
          print('hi');
        } else {
          Get.offAllNamed(Routes.LOGIN);
          print('no');
        }
      },
    );
  }
  
  
  
}
