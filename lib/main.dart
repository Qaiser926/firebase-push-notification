import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_push_notification/firebase_push_notificaiton/push_notification.dart';
import 'package:firebase_push_notification/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  /// background notification k liye he
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackground);
  runApp(const MyApp());
}

/// ye function b background notification k liye h e
@pragma("vm:entry-point")  // ye line important he q k is k bagir project kill k bad noti nhe aye ga. 
Future<void> _firebaseMessagingBackground(RemoteMessage message)async{
  print(message.notification!.title.toString());
  await Firebase.initializeApp();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}