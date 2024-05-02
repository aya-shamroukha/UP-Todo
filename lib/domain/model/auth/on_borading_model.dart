import 'package:todo_application/utils/app_assets.dart';
import 'package:todo_application/utils/app_strings.dart';

class OnBoradingModel{
  final String imagPath;
  final String title;
  final String subtitle;

  OnBoradingModel({required this.imagPath, required this.title, required this.subtitle});
  static List<OnBoradingModel> onBoradingScreen=[
OnBoradingModel(imagPath: AppAssets.on1,title: AppStrings.onBoardingTitleOne,subtitle: AppStrings.onBoardingSubTitleOne),
OnBoradingModel(imagPath: AppAssets.on2,title: AppStrings.onBoardingTitleTwo,subtitle: AppStrings.onBoardingSubTitleTwo),
OnBoradingModel(imagPath: AppAssets.on3,title: AppStrings.onBoardingTitleThree,subtitle: AppStrings.onBoardingSubTitleThree)



  ];
} 