
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo_application/utils/app_colors.dart';
import 'package:todo_application/utils/app_textstyle.dart';




ThemeData darktheme=
   ThemeData(
    //brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    
 appBarTheme: const AppBarTheme(
  backgroundColor: AppColors.background,
  centerTitle: false,
 
 iconTheme: IconThemeData(color: AppColors.white),
  titleTextStyle: 
  TextStyle(fontSize: 24,color: AppColors.white,fontWeight: FontWeight.bold),
elevation: 0,

  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    shape: CircleBorder(),
    backgroundColor: AppColors.primary),
    scaffoldBackgroundColor: AppColors.background,
    textTheme: TextTheme(
      displayLarge: boldStyle(),  
      displayMedium: normalStyle(),
      displaySmall: regularStyle(),

    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
               style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
                )
               ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      
      labelStyle: TextStyle(fontSize: 12.sp, color: AppColors.grey),
      fillColor: AppColors.lightBlack,
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(color: AppColors.grey)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(color: AppColors.grey)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(color: AppColors.grey)),
      hintStyle: TextStyle(fontSize: 12.sp, color: AppColors.grey),
     
      
      
      
      
      ));
  

ThemeData LightTheme=
   ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
 appBarTheme: const AppBarTheme(
  backgroundColor: AppColors.white,
  
  centerTitle: false,
 
 iconTheme: IconThemeData(color: AppColors.white),
  titleTextStyle: 
  TextStyle(fontSize: 24,color: AppColors.white,fontWeight: FontWeight.bold),
elevation: 0,

  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    shape: CircleBorder(),
    backgroundColor: AppColors.primary),
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextTheme(
      displayLarge: boldStyle(),  
      displayMedium: normalStyle(),
      displaySmall: regularStyle(),

    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
               style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
                )
               ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      
      labelStyle: TextStyle(fontSize: 12.sp, color: AppColors.grey),
      fillColor: AppColors.grey,
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(color: AppColors.grey)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(color: AppColors.grey)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(color: AppColors.grey)),
      hintStyle: TextStyle(fontSize: 12.sp, color: AppColors.grey),
     
      
      
      
      
      ));
  
class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData = darktheme;

  ThemeData getTheme() => _themeData;

  void setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }}