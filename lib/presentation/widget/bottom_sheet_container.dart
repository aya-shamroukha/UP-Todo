// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:todo_application/presentation/bloc/task_bloc/task_bloc_event.dart';
// import 'package:todo_application/presentation/widget/custom_button.dart';
// import 'package:todo_application/presentation/widget/my_sizeBox.dart';
// import 'package:todo_application/utils/app_colors.dart';
// import 'package:todo_application/utils/app_strings.dart';

// import '../bloc/task_bloc/task_bloc.dart';
// import '../bloc/task_bloc/task_bloc_state.dart';

// class BottomSheetContainer extends StatelessWidget {
//   const BottomSheetContainer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 240.h,
//       width: double.infinity,
//       color: AppColors.deepGrey,
//       child:
//          Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CustomButton(
//                 onPressed: () {
//                   context.read<TaskBloc>().add(UpDateTask(id: BlocProvider.of<TaskBloc>(context).taskslist.id));
//                 },
//                 text: AppStrings.taskCompleted,
//                 width: 327,
//               ),
//               SizedBox_Height(
//                 height: 10.h,
//               ),
//               CustomButton(
//                   onPressed: () {},
//                   text: AppStrings.deleteTask,
//                   background: AppColors.red,
//                   width: 327),
//               SizedBox_Height(
//                 height: 10.h,
//               ),
//               CustomButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   text: AppStrings.cancel,
//                   width: 327),
//             ],
       
//       ),
//     );
//   }
// }
