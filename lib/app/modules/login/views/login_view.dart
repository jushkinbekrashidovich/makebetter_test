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
          children: [
            Container(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Text('Welcome to makebetter, we encourage to you be healthy.', style: TextStyle(fontSize: 16),)),
            Center(
              child: ElevatedButton(
                
                child: Container(
                  height: 50,
                  width: 180,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
