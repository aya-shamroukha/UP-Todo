

import 'package:todo_application/data/service/notification_service.dart';
import 'package:workmanager/workmanager.dart';
@pragma('vm:entry-point')
//step 2 لازم يكون ب entry section
void callAtcionTask() {
 Workmanager().executeTask((taskName, inputData) {
  LocalNotifationService.showDailySchduledNotification();

 // LocalNotifationService.showBasicNotification();
  return Future.value(true);
 });
}
class WorkMangerSarvice{
  //step1
Future <void> init()async{
 await Workmanager().initialize(
    callAtcionTask, 
    isInDebugMode: true );
    registerMyTask();
}


 //step 3
void registerMyTask()async{
 await Workmanager().registerPeriodicTask('id 1'
  , 'simple notification',
  frequency: const Duration(hours: 12)
  );
}

void cancelTask(){
  Workmanager().cancelAll();
}

}