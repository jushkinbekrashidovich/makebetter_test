import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text(controller!.user.displayName.toString()),
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
                      icon: Icon(Icons.login_outlined)),
                ],
              ),
              body: Column(
                children: [
                  Center(
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.fetchData();
                      },
                      child: Container(
                        child: Text('download'),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        controller.addData();
                      },
                      child: Container(
                        child: Text('add'),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        controller.fetchStepData();
                      },
                      child: Container(
                        child: Text('waking'),
                      )),
                  controller.content(),
                ],
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      child: Text('Drawer Header'),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                    ListTile(
                      title: Text('Item 1'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Text('Item 2'),
                      onTap: () {
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
