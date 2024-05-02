// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_application/domain/model/task/task_model.dart';

import 'package:todo_application/presentation/bloc/task_bloc/task_bloc.dart';
import 'package:todo_application/presentation/bloc/task_bloc/task_bloc_event.dart';
import 'package:todo_application/presentation/bloc/task_bloc/task_bloc_state.dart';
import 'package:todo_application/presentation/widget/coustom_loading.dart';
import 'package:todo_application/presentation/widget/coustom_skip_buttom.dart';
import 'package:todo_application/presentation/widget/custom_button.dart';
import 'package:todo_application/presentation/widget/custom_textfield.dart';
import 'package:todo_application/presentation/widget/my_sizeBox.dart';
import 'package:todo_application/presentation/widget/my_toast.dart';
import 'package:todo_application/presentation/widget/start_end_time_row.dart';
import 'package:todo_application/utils/app_colors.dart';
import 'package:todo_application/utils/app_strings.dart';

// ignore: must_be_immutable
class AddTask extends StatelessWidget {
  AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(context),
      child: BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state is InsertTaskSuccessState) {
           
            Navigator.of(context).pushReplacementNamed('homepage');
          } else if (state is InsertTaskErrorState) {
            showTost(message: AppStrings.faield, state: ToastState.error);
          }
        },
        builder: (context, state) {
          var taskbloc = BlocProvider.of<TaskBloc>(context);
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                  leading: skipButton(() {
                    Navigator.of(context).pushReplacementNamed('homepage');
                  }),
                  title: const Text(
                    AppStrings.addTask,
                  )),
              body: SizedBox(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: BlocProvider.of<TaskBloc>(context).formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //!title
                          Text(
                            AppStrings.tilte,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          SizedBox_Height(height: 8.h),
                          CustomTextfield(
                            validate: (val) {
                              if (val.isEmpty) {
                                return AppStrings.tilteErrorMsg;
                              }
                              return null;
                            },
                            labeltext: AppStrings.tilteHint,
                            controller: taskbloc.titleController,
                          ),
                          SizedBox_Height(height: 24.h),
                          //!note
                          Text(
                            AppStrings.note,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          SizedBox_Height(height: 8.h),
                          CustomTextfield(
                            validate: (val) {
                              if (val.isEmpty) {
                                return AppStrings.noteErrorMsg;
                              }
                              return null;
                            },
                            labeltext: AppStrings.notehint,
                            controller: taskbloc.noteController,
                          ),
                          SizedBox_Height(height: 24.h),
                          //!date
                          Text(
                            AppStrings.date,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          SizedBox_Height(height: 8.h),

                          CustomTextfield(
                            labeltext:
                                DateFormat.yMd().format(taskbloc.currentDate),
                            readonly: true,
                            suffixicon: IconButton(
                                onPressed: () {
                                  context.read<TaskBloc>().add(ShowDateEvent());
                                },
                                icon: const Icon(
                                  Icons.calendar_month_rounded,
                                  color: AppColors.grey,
                                )),
                          ),
                          SizedBox_Height(height: 24.h),
                          //!start and end time
                          StartAndEndTimeRow(taskbloc: taskbloc,),
                          SizedBox_Height(height: 24.h,),
                          //!color
                          Text(
                            AppStrings.color,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          SizedBox_Height(height: 8.h,),
                          //!color listview
                          SizedBox(
                              height: 36.h,
                              width: double.infinity,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 6,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: InkWell(
                                        onTap: () {
                                          context.read<TaskBloc>().add(
                                              SelectColorEvent(index: index));
                                        },
                                        child: CircleAvatar(
                                          backgroundColor:
                                              taskbloc.getcolor(index),
                                          child: index == taskbloc.currentIndex
                                              ? const Icon(
                                                  Icons.check,
                                                  color: AppColors.white,)
                                              : null,
                                        ),
                                      ),
                                    );
                                  })),
                          SizedBox_Height(height: 55.h,),
                          //!button creat task

                          state is InsertTaskLoadingState
                              ? const Loading(): Center(
                                  child: CustomButton(
                                  onPressed: () {
                                    if (BlocProvider.of<TaskBloc>(context)
                                        .formkey.currentState!.validate()) {
                                      context.read<TaskBloc>().add(
                                          InsertTaskEvent(
                                              taskModel: TaskModel(
                                                  //  id: 1,
                                                  date: DateFormat.yMd().format(
                                                      taskbloc.currentDate),
                                                  color: taskbloc.currentIndex,
                                                  title: taskbloc.titleController.text,
                                                  note: taskbloc.noteController.text,
                                                  startTime: taskbloc.startTime,
                                                  endTime: taskbloc.endTime,
                                                  isCompleted: 0)));
                                      print('-------------button');
                                      print(taskbloc.taskslist);
                                    }
                                  },
                                  text: AppStrings.createTask,
                                  width: double.infinity,
                                )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

