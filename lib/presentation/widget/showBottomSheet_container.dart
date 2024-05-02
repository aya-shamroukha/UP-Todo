import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_application/presentation/bloc/task_bloc/task_bloc.dart';
import 'package:todo_application/presentation/bloc/task_bloc/task_bloc_event.dart';
import 'package:todo_application/presentation/bloc/task_bloc/task_bloc_state.dart';
import 'package:todo_application/presentation/widget/custom_button.dart';
import 'package:todo_application/presentation/widget/my_sizeBox.dart';
import 'package:todo_application/presentation/widget/my_toast.dart';
import 'package:todo_application/utils/app_colors.dart';
import 'package:todo_application/utils/app_strings.dart';

import '../../domain/model/task/task_model.dart';

class ShowBottomSheetContainer extends StatelessWidget {
  const ShowBottomSheetContainer({
    super.key,
   required this.taskModel, this.ontapDelete,
  });

 final TaskModel taskModel;
 final dynamic ontapDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      width: double.infinity,
      color: AppColors.deepGrey,
      child: BlocListener<
          TaskBloc,
          TaskState>(
         listener: (context,state){
                if(state is DeleteTaskSuccessState){
                   showTost(
                    message: AppStrings.deleteTaskSuccessfully,
                    state: ToastState.success);
                
              }else if(state is UpDateTaskSuccessState){
                showTost(
                    message: AppStrings.taskCompletedsuccess,
                    state: ToastState.success);
              }
        },
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
          taskModel.isCompleted ==1
                ? Container()
                : CustomButton(
                    onPressed: () {
                      context.read<TaskBloc>()
                          .add(UpDateTask(
                              id: taskModel.id!));
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(
                              'homepage',
                              (route) =>false);
                    },
                    text: AppStrings.taskCompleted,
                    width: 327,
                  ),
            SizedBox_Height(
              height: 10.h,
            ),
            CustomButton(
                onPressed:ontapDelete,
               
                text: AppStrings.deleteTask,
                background:AppColors.red,
                width: 327),
            SizedBox_Height(
              height: 10.h,),
            CustomButton(
                onPressed: () {
                  Navigator.of(context).pop();},
                text: AppStrings.cancel,
                width: 327),
          ],
        ),
      ),
    );
  }
}
