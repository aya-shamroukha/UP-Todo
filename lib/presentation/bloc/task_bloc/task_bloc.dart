// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_application/config/theme.dart';
import 'package:todo_application/data/local_storage.dart';
import 'package:todo_application/data/service/notification_service.dart';
import 'package:todo_application/data/sqflite.dart';
import 'package:todo_application/domain/model/task/task_model.dart';
import 'package:todo_application/utils/app_colors.dart';
import 'task_bloc_event.dart';
import 'task_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  DateTime currentDate = DateTime.now();
    DateTime selectDate = DateTime.now();
    TimeOfDay ? schduledStartTime;
     TimeOfDay? schduledendTime;
    bool isDark=true;
  TextEditingController titleController = TextEditingController();
TextEditingController noteController = TextEditingController();
TextEditingController dateController = TextEditingController();
  int currentIndex = 0;
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    List<TaskModel> taskslist = [];
  String startTime = DateFormat('hh:mm a').format(DateTime.now().add(const Duration(minutes: 2)));
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));

        Color getcolor(index) {
                                    switch (index) {
                                      case 0:
                                        return AppColors.red;
                                      case 1:
                                        return AppColors.green;
                                      case 2:
                                        return AppColors.blue;
                                      case 3:
                                        return AppColors.purple;
                                      case 4:
                                        return AppColors.orange;
                                      case 5:
                                        return AppColors.blueGrey;
                                      default:
                                        return AppColors.grey;
                                    }
                                  }
  TaskBloc(context) : super(TaskBlocInitial()) {
    //!show date event
    on<ShowDateEvent>((event, emit) async {
      emit(GetDateLoadingState());
      DateTime? pikedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2026));

      if (pikedDate != null) {
        currentDate = pikedDate;
        emit(GetDateSuccessState());
      } else {
        print('pikeddate=null');
        emit(GetDateErrorState());
      }
    });
    //! show start  time event
    on<ShowStartTimeEvent>((event, emit) async {
      emit(GetStartTimeLoadingState());
      TimeOfDay? pickedStartTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(DateTime.now()));
      if (pickedStartTime != null) {
        startTime = pickedStartTime.format(context);
        schduledStartTime=pickedStartTime;
        emit(GetStartTimeSuccessState());
      } else {
        print('--------------pikedTime=null');
        schduledStartTime=TimeOfDay(hour: currentDate.hour, minute: currentDate.minute);
        emit(GetStartTimeErrorState());
      }
    });
    //!insert task
  on<InsertTaskEvent>((event, emit)async {
      emit(InsertTaskLoadingState());
      try {
    await   Future.delayed(const Duration(seconds: 1));
        await getIt<Sqflite>().inserToDB(event.taskModel);
   
    //     taskslist.add(
    //       event.taskModel
    //         );
    //         print('-----------------');
    //          print(taskslist[0]);
      
        LocalNotifationService.showSchduledNotification(currentDate: currentDate,
        body: 'Are you ready 🤔?',
        schduledTime:schduledStartTime??TimeOfDay(hour: currentDate.hour, minute: currentDate.minute) ,
        taskModel: event.taskModel,
        //minute: 2,
        );
        LocalNotifationService.showSchduledNotification(currentDate: currentDate,
        body: 'Did You completed the task 😮?',
        schduledTime:schduledendTime??TimeOfDay(hour: currentDate.hour, minute: currentDate.minute),
        taskModel: event.taskModel
        );
       
        emit(InsertTaskSuccessState());
        titleController.clear();
        noteController.clear();
        print('-----------success');
      } catch (e) {
         print('-------------------error');
        print(e.toString());
        emit(InsertTaskErrorState());
      }
    });

    //!getTask

    on<GetTasks>((event, emit) async{
      emit(GetTaskLoadingState());
      try{

     await getIt<Sqflite>().getFormDB().then((value) {
      taskslist=value.map((e) => TaskModel.fromjson(e)).toList().where((element) => 
      element.date==DateFormat.yMd().format(selectDate)).toList();
     });
     print(currentDate);
     emit(GetTaskSuccessState());
      }catch(e){
        emit(GetTaskErrorState());
      }
    });

    //!update task
    on<UpDateTask>((event, emit) async{
emit(UpDateTaskLoadingState());
try{

      await getIt<Sqflite>().updateDB(event.id);
      emit(UpDateTaskSuccessState());
      
}catch(e){
  emit(UpDateTaskErrorState());
}
    });
//!delte task
on<DeleteTask>((event, emit)async {
  emit(DeleteTaskLoadingState());
  try{
     await getIt<Sqflite>().deleteFromDB(event.id);
     
     emit(DeleteTaskSuccessState());
    
  }catch(e){
    emit(DeleteTaskErrorState());
  }
});
    //!show end time event
    on<ShowEndTimeEvent>((event, emit) async {
       emit(GetEndTimeLoadingState());
      TimeOfDay? pickedendTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(DateTime.now()));
      if (pickedendTime != null) {
        endTime = pickedendTime.format(context);
        schduledendTime=pickedendTime;
         emit(GetEndTimeSuccessState());
      } else {
        print('pikedTime=null');
         schduledendTime=TimeOfDay(hour: currentDate.hour, minute: currentDate.minute);
         emit(GetEndTimeLoadingState());
      }
    });
    //!select color
    on<SelectColorEvent>((event, emit) {
      
                                         currentIndex=event.index;
                                       emit(SelectColorSuccessState());
    });


       
  //!get select date
  on<GetSelectDate>((event, emit) {
    emit(GetSelectDateLoadingState());
    selectDate=event.date;
   
    print(currentDate);
    emit(GetSelectDateSuccessState());
  });
  //!dark light
  on<DarkLightMode>((event, emit) {
isDark = !isDark;
if (isDark) {
        // Set dark theme
        Provider.of<ThemeNotifier>(context, listen: false).setTheme(darktheme);
      } else {
        // Set light theme
        Provider.of<ThemeNotifier>(context, listen: false).setTheme(LightTheme);
  getIt<SharedPreferences>().setBool('isDark',isDark);
 print('------------------event');
 print(isDark);
emit(DarkLightModeSuccessState());
 print('------------------state');

  }});
  on<GetTheme>((event, emit)async {
  isDark= await getIt<SharedPreferences>().getBool('isDark')?? true;
   print('------------------event get theme');
 print(isDark);
    emit(GetThemeSuccessState());
  });
   
  
  }

}
