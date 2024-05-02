import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_application/utils/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  
    // ignore: prefer_const_constructors_in_immutables
    CustomTextfield({
    super.key,
    this.validate,
    required this.labeltext,  this.controller, this.suffixicon,  this.readonly=false,
  });
 
  final String labeltext;
  final TextEditingController? controller;
final dynamic validate;
final IconButton?suffixicon;
final bool readonly;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setstate) {
      return Column(
        children: [
          TextFormField(
            style: TextStyle(fontSize: 13.sp, color: AppColors.white),
       //  keyboardType:textInputType ,
            validator: validate,
             autovalidateMode: AutovalidateMode.onUserInteraction,
      readOnly: readonly,
            controller: controller,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              errorBorder: 
              Theme.of(context).inputDecorationTheme.errorBorder,
              focusedBorder:
                  Theme.of(context).inputDecorationTheme.focusedBorder,
              enabledBorder:
                  Theme.of(context).inputDecorationTheme.enabledBorder,
              hintText: labeltext,
              suffixIcon: suffixicon
             
            ),
          ),
        ],
      );
    });
  }
}