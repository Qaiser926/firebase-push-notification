import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServicess{

  final message=FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

  

  void requestNotificationPermission()async{

    NotificationSettings setting=await message.requestPermission(
      alert: true,
      badge: true,
      announcement: true,
       carPlay: true,
       criticalAlert: true,
       provisional: true,
       sound: true,
    );
    if(setting.authorizationStatus==AuthorizationStatus.authorized){
      print('user granted permission');

    }else if(setting.authorizationStatus==AuthorizationStatus.provisional){
 print('user granted provisional permission');
    }else{
 print('user denied permission');
    }
  }


void  initLocalNotification(BuildContext context , RemoteMessage message)async{
     var androidInitializationSetting=const AndroidInitializationSettings("@mipmap/ic_launcher");
      var iosInitializationSetting= const DarwinInitializationSettings();

      var initializationSetting=InitializationSettings(
        
      android: androidInitializationSetting,
      iOS: iosInitializationSetting
      );
      await _flutterLocalNotificationsPlugin.initialize(
        initializationSetting,
        onDidReceiveNotificationResponse: (payload){

        }
      );
   }


  void firebaseInit(){
    FirebaseMessaging.onMessage.listen((event) {
   if(event.notification!=null){
       if (kDebugMode) {
        print("Qaiser"+event.notification!.title.toString());
         print("Qaiser"+event.notification!.body.toString());
         print("Qaiser"+event.data.toString());
         print("Qaiser"+event.data["id"]);
         print("Qaiser"+event.data["type"]);
      }
   }
      showNotification(event);
     
    });
  }
 
  Future<void> showNotification(RemoteMessage message)async{

    AndroidNotificationChannel channel=AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(),
        "High Importance Notification",
        importance: Importance.max,

        );

   AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails(
    channel.id.toString(),
    channel.name.toString(),
    channelDescription: "your Channel Des",
    importance: Importance.high,
    priority: Priority.high,
    ticker: 'ticker',
    );
  const  DarwinNotificationDetails darwinNotificationDetails=DarwinNotificationDetails(
      presentSound: true,
      presentBadge: true,
      presentAlert: true,
    );
    NotificationDetails notificationDetails=NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails
    );
    Future.delayed(Duration.zero,(){
       _flutterLocalNotificationsPlugin.show(
      0, 
      message.notification!.title.toString(), 
      message.notification!.body.toString(), 
      notificationDetails);
    }
   
    );

  }


  Future<String> getDeviceToken()async{
  String? token= await message.getToken();
    return token!;
  }
 
   void onRefreshToken()async{
  
  await message.onTokenRefresh.listen((event) {
  event.toString();
 });
  
  }

void handMessage(BuildContext context, RemoteMessage message){

}

}