import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_application/presentation/bloc/task_bloc/task_bloc.dart';
import 'package:todo_application/presentation/bloc/task_bloc/task_bloc_event.dart';
import 'package:todo_application/presentation/widget/custom_textfield.dart';
import 'package:todo_application/presentation/widget/my_sizeBox.dart';
import 'package:todo_application/utils/app_colors.dart';
import 'package:todo_application/utils/app_strings.dart';

class StartAndEndTimeRow extends StatelessWidget {
  const StartAndEndTimeRow({
    super.key,
    required this.taskbloc,
  });

  final TaskBloc taskbloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppStrings.startTime,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall,
            ),
            SizedBox_Height(height: 8.h),
            SizedBox(
                height: 60.h,
                width: 150.w,
                child: CustomTextfield(
                  readonly: true,
                  suffixicon: IconButton(
                    icon: const Icon(Icons.timer_outlined,
                        color: AppColors.grey),
                    onPressed: () {
                      context
                          .read<TaskBloc>()
                          .add(ShowStartTimeEvent());
                    },
                  ),
                  labeltext: taskbloc.startTime,
                )),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppStrings.endTime,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall,
            ),
            SizedBox_Height(height: 8.h),
            SizedBox(
                height: 60.h,
                width: 150.w,
                child: CustomTextfield(
                  readonly: true,
                  suffixicon: IconButton(
                    icon: const Icon(Icons.timer_outlined,
                        color: AppColors.grey),
                    onPressed: () async {
                      context
                          .read<TaskBloc>()
                          .add(ShowEndTimeEvent());
                    },
                  ),
                  labeltext: taskbloc.endTime,
                )),
          ],
        )
      ],
    );
  }
}
