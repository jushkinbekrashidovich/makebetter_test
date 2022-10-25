import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:makebetter_test/app/modules/my_achievements/controllers/my_achievements_controller.dart';

import '../../my_achievments_detailsView.dart';

class MyAchievementsView extends GetView<MyAchievementsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('My Achievements'),
        ),
        body: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 10, top: 10),
            //primary: false,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12 * 1.0),
                child: Visibility(
                    visible: controller.isLoading.value,
                    child: Container(
                      //padding: EdgeInsets.all(50),
                      //width: 85.w,
                      child: Container(
                          padding: EdgeInsets.all(15),
                          //width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12 * 1.0),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "Loading",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )),
                    )),
              ),
              ...controller.myAchievments.value.map((element) {
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyAchievmentsDetailsView(
                          
                          title: element.title.toString(), 
                          description: element.description.toString(),
                          image: element.image.toString(),
                          
                          
                        ),
                      ),
                    );
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            height: 110,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 110,
                                          child: Image.network(
                                              element.image.toString())),
                                              SizedBox(width: 10,),
                                      SizedBox(
                                        width: 100,
                                        height: 49,
                                        child: Text(
                                          element.title.toString(),
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 22),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                
                                // SizedBox(width: 10,),
                                SizedBox(
                                  width: 80,
                                  height: 45,
                                  child: Text(
                                    element.description.toString(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 13),
                                          
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                );
              }),
            ]),
      ),
    );
  }
}
