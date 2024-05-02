import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_application/data/local_storage.dart';
import 'package:todo_application/presentation/widget/my_sizeBox.dart';
import 'package:todo_application/utils/app_assets.dart';
import 'package:todo_application/utils/app_colors.dart';
import 'package:todo_application/utils/app_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
      void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
    bool isVisited=getIt.get<SharedPreferences>().getBool('onboarding')??false;
    Future.delayed(const Duration(seconds: 3),(){
      isVisited?
 Navigator.of(context).pushReplacementNamed("homepage"):
 Navigator.of(context).pushReplacementNamed("onBorading");

    });
  }
  @override
  void dispose() {
   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: 
      Column(
              mainAxisAlignment: MainAxisAlignment.center,

        children: [
        SizedBox(
          width: 113.w,
          height: 113.h,
          child: Image.asset(AppAssets.logo)),
          SizedBox_Height(height: 24.h),
        Text(AppStrings.appName,style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.white),)
      ],),),
    );
  }
}