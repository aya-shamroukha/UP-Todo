import 'dart:async';
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:todo_application/domain/model/task/task_model.dart';
class LocalNotifationService{
 static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin= FlutterLocalNotificationsPlugin();
 //! انا بعمل stream controller لحتى اقدر فوت على محتويات الاشعار
 static StreamController<NotificationResponse> streamController=StreamController();
 static ontap( NotificationResponse  notificationResponse){
log(notificationResponse.id!.toString());
        log(notificationResponse.payload!.toString());
  streamController.add(notificationResponse);
 }



  static Future init()async{
InitializationSettings settings=const InitializationSettings(

  android: AndroidInitializationSettings("@mipmap/ic_launcher")
);
    flutterLocalNotificationsPlugin.initialize(settings,
    onDidReceiveNotificationResponse: ontap,
    onDidReceiveBackgroundNotificationResponse: ontap,
    );
  }




//!basic

  static void showBasicNotification()async{
NotificationDetails details=const NotificationDetails(
  android: AndroidNotificationDetails('id 1',
  //for show notification in saqur
  importance:Importance.max,
  priority:Priority.high,
   'basic ') ,
   
);
//!.show يعني اظهار اشعار عادي وقت اكبس على شي
    await flutterLocalNotificationsPlugin.show(0, 'Up todo', 'Welcome 🥳', details,
    payload: 'welcome 🥳'
    );
  }




//!repeted notification
// static void showRepetedNotification()async{
// NotificationDetails details=const NotificationDetails(
//   android: AndroidNotificationDetails('id 2',
//   importance:Importance.max,
//   priority:Priority.high,
//    'repteated ')
// );

// //!.period يعني بتضل يتكرر
//     await flutterLocalNotificationsPlugin.periodicallyShow(1, 'Reated Notification', DateTime.now().toString(), 
//      RepeatInterval.everyMinute,
//     details,
//     payload: 'welcome 🥳',
   
//     );
//   }






  //!daily for 4 ,30 pm evrey day
  static void showDailySchduledNotification()async{
    NotificationDetails details=const NotificationDetails(
  android: AndroidNotificationDetails(
    'id 3',
  importance:Importance.max,
  priority:Priority.high,
   'repteated ')
);
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Damascus'));
  var currentTime=tz.TZDateTime.now(tz.local);
  var schduledTime=tz.TZDateTime(
tz.local,
currentTime.year,
currentTime.month,
currentTime.day,
16



       );
log("befor time.hour${schduledTime.hour}");
log("befor time.day${schduledTime.day}");

       if(schduledTime.isBefore(currentTime)){
schduledTime= schduledTime.add(const Duration(days: 1));

log("after time.hour${schduledTime.hour}");
log("after time.day${schduledTime.day}");
       }

       //! .zoned يعني بحطلو وقت محدد يبعت فيه وبياخدو حسب موقعي 

await flutterLocalNotificationsPlugin.zonedSchedule(
   3,
       'Write your tasks for tomorrow', 
      'Have a productive day 🤩',
       schduledTime,
       details, 
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);

  }







   static  void showSchduledNotification({required DateTime currentDate,required TimeOfDay schduledTime,
  required TaskModel taskModel,required String body, 
  })async{
NotificationDetails details=const NotificationDetails(
  
  android: AndroidNotificationDetails('id 3',
  
  importance:Importance.max,
  priority:Priority.high,
   'repteated ')
);
  tz.initializeTimeZones();
 tz.setLocalLocation(tz.getLocation('Asia/Damascus'));
  log(tz.local.name.toString());
  log(tz.TZDateTime.now(tz.local).hour.toString());
  log(tz.TZDateTime.now(tz.local).minute.toString());
   var currentTime=tz.TZDateTime.now(tz.local);
   var schduledTimes= tz.TZDateTime(tz.local,
      currentDate.year,
      currentDate.month,
      currentDate.day,
      schduledTime.hour,
      schduledTime.minute

      );
      
       if(schduledTimes.isBefore(currentTime)){
schduledTimes= schduledTimes.add(const Duration(minutes: 1));

log("after time.hour${schduledTime.hour}");
log("after time.day${schduledTime.minute}");
       }
    await flutterLocalNotificationsPlugin.zonedSchedule(
      
    taskModel.id??2,
       taskModel.title,

       body, 
       schduledTimes.add(const Duration(milliseconds: 500)),
      // tz.TZDateTime(tz.local,
      // currentDate.year,
      // currentDate.month,
      // currentDate.day,
      // schduledTime.hour,
      // schduledTime.minute

      // ).add(Duration(milliseconds: 500)),
      //.subtract(Duration(minutes: minute??0)).add(Duration(minutes: 1)),
      
      //.now(tz.local).add(const Duration(seconds: 10)),
       details, 
       payload: ' Tiltle :${ taskModel.title} Note:  ${ taskModel.note}',
       androidScheduleMode :AndroidScheduleMode.exactAllowWhileIdle ,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
      
log(" time.hour${schduledTime.hour}");
log(" time.day${schduledTime.minute}");
  }
  static void cancelNotification(int id)async{
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}