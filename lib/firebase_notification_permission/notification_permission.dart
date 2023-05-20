import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_push_notification/servieces/notification_permission_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FirebaseNotificationPermission extends StatefulWidget {
  const FirebaseNotificationPermission({super.key});

  @override
  State<FirebaseNotificationPermission> createState() => _FirebaseNotificationPermissionState();
}

class _FirebaseNotificationPermissionState extends State<FirebaseNotificationPermission> {

  NotificationServicess notificationServicess=NotificationServicess();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // notificationServicess.onRefreshToken();
    
    // notificationServicess.firebaseInit();
    // notificationServicess.requestNotificationPermission();
    // notificationServicess.getDeviceToken().then((value) {
    //   print("the device token is: $value ");
      
    // });
    
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          // LocalNotificationService.display(message);

        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}