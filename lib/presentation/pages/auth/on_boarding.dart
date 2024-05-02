import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_application/data/local_storage.dart';
import 'package:todo_application/domain/model/auth/on_borading_model.dart';
import 'package:todo_application/presentation/widget/custom_button.dart';
import 'package:todo_application/utils/app_colors.dart';
import 'package:todo_application/utils/app_strings.dart';
import 'package:todo_application/data/service/notification_service.dart';

// ignore: must_be_immutable
class OnBoaringScreens extends StatelessWidget {
  OnBoaringScreens({super.key});
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(24),
        child: PageView.builder(
          controller: controller,
          itemCount: OnBoradingModel.onBoradingScreen.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                //!skip text
                index != 2
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          child: Text( AppStrings.skip,style: Theme.of(context).textTheme.displaySmall!.copyWith(color:AppColors.grey),),
                          onPressed: () {
                            controller.jumpToPage(2);
                          },
                        ),
                      )
                    :  SizedBox(
                        height: 50.h,
                      ),
                 SizedBox(
                  height: 16.h,
                ),
                //!image
                Image.asset(OnBoradingModel.onBoradingScreen[index].imagPath,fit: BoxFit.cover,),
                 SizedBox(
                  height: 16.h,
                ),

                //!dots
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                     
                      dotHeight: 4,
                      spacing: 8
                     
                      ),
                ),
                 SizedBox(
                  height: 50.h,
                ),

                //!title
                Text(
                  OnBoradingModel.onBoradingScreen[index].title,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.normal)
                  
                ),
                 SizedBox(
                  height: 32.h,
                ),

                //!subTitle
                Text(
                  OnBoradingModel.onBoradingScreen[index].subtitle,
                  textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(color:AppColors.grey)
                ),
                const Spacer(),
                //!buttons
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //back button
                    index != 0
                        ?TextButton(
                           child:Text( AppStrings.back,style: Theme.of(context).textTheme.displaySmall!.copyWith(color: AppColors.grey)),
                            onPressed: () {
                              controller.previousPage(
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.fastLinearToSlowEaseIn,
                              );
                            },
                          )
                        : Container(),
                    //spacer
                    const Spacer(),
                    //next Button
                    index != 2
                        ? CustomButton(
                          text: AppStrings.next,
                          width: 90.w,

                        
                            onPressed: () {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            },
                          )
                        : CustomButton(
                          text: AppStrings.getStarted,
                         // width: 90.w,
                            onPressed: () async {
                             await getIt.get<SharedPreferences>().setBool('onboarding', true).then((value) {
LocalNotifationService.showBasicNotification();
                             Navigator.of(context).pushReplacementNamed('homepage');
                             });
                            })
                  ],
                )
              ],
            );
          },
        ),
      )),
    );
  }
}
