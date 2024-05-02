import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_application/presentation/widget/my_sizeBox.dart';
import 'package:todo_application/utils/app_assets.dart';
import 'package:todo_application/utils/app_colors.dart';
import 'package:todo_application/utils/app_strings.dart';

class EmptyTaskComponent extends StatelessWidget {
  const EmptyTaskComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(child: SizedBox(
      width: 277.w,
      height: 277.h,
      child: Image.asset(AppAssets.noTasks,fit: BoxFit.cover,))),
       Align(
      alignment: Alignment.center,
      child: Text(
          AppStrings.noTaskTitle,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: 20, fontWeight: FontWeight.w100),
        ),
    ),
      SizedBox_Height(height: 10.h),
      Align(
        alignment: Alignment.center,
        child: Text(
          AppStrings.noTaskSubTitle,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith( fontWeight: FontWeight.w100,color: AppColors.grey),
        ),
      ),
    ],);
  }
}
