// ignore_for_file: avoid_print

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_application/presentation/bloc/task_bloc/task_bloc.dart';
import 'package:todo_application/presentation/bloc/task_bloc/task_bloc_event.dart';
import 'package:todo_application/presentation/bloc/task_bloc/task_bloc_state.dart';
import 'package:todo_application/presentation/widget/empty_task_compnent.dart';
import 'package:todo_application/presentation/widget/showBottomSheet_container.dart';
import 'package:todo_application/presentation/widget/task_Component.dart';
import 'package:todo_application/presentation/widget/my_sizeBox.dart';
import 'package:todo_application/utils/app_colors.dart';
import 'package:todo_application/utils/app_strings.dart';

  bool dark_light=true;
class HomePage extends StatelessWidget {
   HomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(context)..add(GetTasks()),
      child: Builder(builder: (context) {
        return BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            var addtaskbloc = BlocProvider.of<TaskBloc>(context);
            return SafeArea(
              child: Scaffold(
                
                floatingActionButton: 
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('addtask');
                      },
                      backgroundColor: Theme.of(context)
                          .floatingActionButtonTheme
                          .backgroundColor,
                      child: const Icon(
                        Icons.add,
                        color: AppColors.white,
                      ),
                    ),
                   
                appBar: AppBar(
                  actions:[
                    PopupMenuButton(
                      color: AppColors.background,
                      itemBuilder:  ((context) => [
                       PopupMenuItem( child: 
                       
                       InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacementNamed('completed');
                        },
                         child: Row(children: [
                         Icon(Icons.check),
                         Text('Completed Task',style: Theme.of(context).textTheme.displaySmall,)
                         ],),
                       ) 
                       ,)
                    ])),
                  ],
                  backgroundColor: AppColors.background,
                  // actions:[ IconButton(onPressed: (){
                  //   context.read<TaskBloc>().add(DarkLightMode());
                  //   print(addtaskbloc.isDark);
                  // }, icon: 
                  
                  // addtaskbloc.isDark
                  //         ? Icon(Icons.
                  //         nights_stay)
                  //         : Icon(Icons.sunny),
                  //     color:  addtaskbloc.isDark
                  //         ? Colors.grey
                  //         : Colors.yellow,
                  // ),],
                    title: Text(DateFormat.yMMMMd().format(DateTime.now()))),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.today,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: 24, fontWeight: FontWeight.w100),
                      ),
                      SizedBox_Height(height: 20.h),
                      //!datepiker
                      SizedBox(
                        height: 94.h,
                        child: DatePicker(
                          DateTime.now(),
                          deactivatedColor: AppColors.primary,
                          initialSelectedDate: DateTime.now(),
                          selectionColor: AppColors.primary,
                          selectedTextColor: AppColors.white,
                          dateTextStyle: const TextStyle(color: AppColors.grey),
                          dayTextStyle: const TextStyle(color: AppColors.grey),
                          monthTextStyle:
                              const TextStyle(color: AppColors.grey),
                          onDateChange: (date) {
                            context
                                .read<TaskBloc>()
                                .add(GetSelectDate(date: date));
                            context.read<TaskBloc>().add(GetTasks());
                            //      print(addtaskbloc. currentDate);
                          },
                        ),
                      ),
                      SizedBox_Height(height: 30.h),
                      addtaskbloc.taskslist.isEmpty
                          ? const EmptyTaskComponent()
                          : Expanded(
                              child: ListView.builder(
                                  itemCount: addtaskbloc.taskslist.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return ShowBottomSheetContainer(
                                                  ontapDelete:   () {
                  context.read<TaskBloc>()
                      .add(DeleteTask(
                          id:addtaskbloc.taskslist[index].id!));
                  Navigator.of(context).pushNamedAndRemoveUntil(
                          'homepage',(route) =>false);
                },
                                                  taskModel:
                                                 addtaskbloc.taskslist[index],);
                                              });
                                        },
                                        child: 
                                        addtaskbloc.taskslist[index].isCompleted==0?TaskComponent(
                                          taskModel:
                                              addtaskbloc.taskslist[index],
                                        ):
                                        addtaskbloc.taskslist.isEmpty
                          ? const EmptyTaskComponent():Container()
                                        );
                                  }))
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

