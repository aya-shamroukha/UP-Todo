

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_application/domain/model/task/task_model.dart';
import 'package:todo_application/presentation/widget/my_sizeBox.dart';
import 'package:todo_application/utils/app_colors.dart';
import 'package:todo_application/utils/app_strings.dart';

class TaskComponent extends StatelessWidget {
   const TaskComponent({
    super.key,
     required this.taskModel,
  });
   final TaskModel taskModel;
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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 127.h,
      margin: EdgeInsets.only(bottom: 16.h),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: getcolor(taskModel.color) , borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskModel.title,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 24),
                ),
                SizedBox_Height(height: 15.h),
                Row(
                  children: [
                    const Icon(
                      Icons.timer_outlined,
                      color: AppColors.white,
                    ),
                    SizedBox_width(
                      width: 5.w,
                    ),
                    Text(
                      '${taskModel.startTime}  - ${taskModel.endTime} ',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: AppColors.white.withOpacity(0.44)),
                          
                    ),
                    
                  ],
                ),
                SizedBox_Height(height: 15.h),
                Text(
                  taskModel.note,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 24,
                      ),
                ),
              ],
            ),
          ),
          Container(
            width: 0.5.w,
            height: 60.h,
            color: AppColors.white,
          ),
          SizedBox_width(
            width: 5.w,
          ),
          RotatedBox(
              quarterTurns: 3,
              child: Text(
                taskModel.isCompleted==1?
                AppStrings.completed:AppStrings.toDo,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 16,
                    ),
              ))
        ],
      ),
    );
  }
}
