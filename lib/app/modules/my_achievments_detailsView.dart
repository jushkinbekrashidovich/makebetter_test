import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyAchievmentsDetailsView extends StatelessWidget {
  const MyAchievmentsDetailsView({super.key, required this.title, required this.description, required this.image});

 
  final String title;
  final String description;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Achievements'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10, left: 10, top: 15, bottom: 20),

            height: 250,
            child: Image.network(image)),
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(title, style: TextStyle(fontSize: 24),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            )),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: Text(description, style: TextStyle(fontSize: 14),
            
            ),
          )

        ],
      ),
    );
  }
}