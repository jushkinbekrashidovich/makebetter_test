import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => (Scaffold(
      body: Container(
        color:Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
              padding: EdgeInsets.only(right: 10, left: 15),
              child: Text('Welcome to', style: TextStyle(fontSize: 20,color: Colors.green),)),
              Container(
              padding: EdgeInsets.only(right: 10, left: 15),
              child: Text('makebetter', style: TextStyle(fontSize: 42,color: Colors.green),)),
              Container(
              padding: EdgeInsets.only(right: 10, left: 15),
              child: Text('We help to you keep healthy', style: TextStyle(fontSize: 12,color: Colors.green),)),

              ],
            ),
            
            Center(
              child: ElevatedButton(
                
                child: Container(
                  height: 30,
                  width: 180,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                        ),
                        child: SvgPicture.asset('assets/google.svg')),
                      Text('Sign in with google'),
                    ],
                  ),
                ),
                onPressed: (){
                  controller.login();

                },
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
