import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const Text('makeBetter'),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text(
                                  "Delete account?",
                                  style: TextStyle(),
                                ),
                                //content:  Text("Haqiqatdan chiqishni xohlaysizmi".tr),
                                actions: [
                                  CupertinoDialogAction(
                                      child: Text(
                                        "Yes",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      onPressed: () {
                                        controller.logout();
                                      }),
                                  CupertinoDialogAction(
                                      child: Text(
                                        "No",
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      }),
                                ],
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.login_outlined,
                        color: Colors.red,
                      )),
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 25, left: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: ListTile(
                        title: Text('My Achievements 🎊', style: TextStyle(fontSize: 25, color: Colors.black),textAlign: TextAlign.center,),
                        onTap: () {
                          Get.toNamed(Routes.MY_ACHIEVEMENTS);

                          // Update the state of the app.
                          // ...
                        },
                      ),
                  ),
                  Column(
                    children: [
                      Container(
                    width: double.infinity,
                    height: 190,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 220, 219, 219),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.nofSteps.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 75),
                        ),
                        Text('Steps',
                            style: TextStyle(
                                color: Color.fromARGB(255, 112, 112, 112),
                                fontSize: 17)),
                      ],
                    ),
                  ),
                    SizedBox(height: 10,),
                     ElevatedButton(
                      onPressed: () {
                        controller.fetchStepData();
                      },
                      child: Container(
                        child: Text('update'),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  controller.content(),
                    
                    ],
                  ),
                  SizedBox()
                  
                  
                  // ElevatedButton(
                  //     onPressed: () {
                  //       controller.fetchData();
                  //     },
                  //     child: Container(
                  //       child: Text('download'),
                  //     )),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       controller.addData();
                  //     },
                  //     child: Container(
                  //       child: Text('add'),
                  //     )),
                 
                ],
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      child: Column(
                        children: [
                          Icon(Icons.person, size: 70,),
                          SizedBox(height: 30,),
                          Text(controller.user.displayName.toString(), style: TextStyle(fontSize: 20),),

                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                    ListTile(
                      title: Text('My Achievements 🎊', style: TextStyle(fontSize: 25),),
                      onTap: () {
                        Get.toNamed(Routes.MY_ACHIEVEMENTS);

                        // Update the state of the app.
                        // ...
                      },
                    ),
                  ],
                ),
              ),
            ));
  }
}
