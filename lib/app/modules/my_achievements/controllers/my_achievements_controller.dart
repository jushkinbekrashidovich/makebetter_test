import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/model/my_achievements_model.dart';

class MyAchievementsController extends GetxController {
  
  late FirebaseFirestore firestore;

  final myAchievments = <MyAchievements>[].obs;
  final isLoading = true.obs;

  
  @override
  void onInit() {
    firestore = FirebaseFirestore.instance;
    super.onInit();
  }

  @override
  void onReady() async{
    isLoading.value = true;
    try {
       myAchievments.value = await fetchmyAchievements();
       print('fetched successfully');
    } catch (err) {
      Get.snackbar(
          "Error while fetching achievements from server: " + err.toString(),'');
      throw err;
    }
    isLoading.value = false;
    super.onReady();
  }

  @override
  void onClose() {}

  Future<List<MyAchievements>> fetchmyAchievements() async {
    final List<MyAchievements> myAchievments = [];
    await firestore
        .collection("myAchievments")
        .get()
        .then((value) {
      //print(value.size);
      value.docs.forEach((element) {
        final achievement = MyAchievements.fromJson(element.data());
        achievement.id = element.id;
        //print(achievement.id);
        myAchievments.add(achievement);
      });
    });
    return myAchievments;
  }

}
