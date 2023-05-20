import 'package:firebase_push_notification/firebase_notification_permission/notification_permission.dart';
import 'package:firebase_push_notification/firebase_push_notificaiton/push_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    body:Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            Get.to(PushNotification());
          }, child:const Text("firebase push notification")),
          ElevatedButton(onPressed: (){
              Get.to(FirebaseNotificationPermission());
          }, child:const Text("firebase notification permission")),
        ],
      ),
    )
    );
  }
}