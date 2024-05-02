// ignore_for_file: sort_child_properties_last


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_application/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, this.height=40, this.width, required this.onPressed, this.background, required this.text, this.textcolor,
  });
final double ?height;
final double ?width;
final VoidCallback onPressed;
final Color? background;
final String text;
final Color ?textcolor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height!.h,
     width: width,
      
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith
        (backgroundColor: MaterialStateProperty.all(background??AppColors.primary)),
        child: Text(text,
      
      style: Theme.of(context).textTheme.displaySmall,),
      
      onPressed: onPressed,),
    );
  }
}