import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_application/config/theme.dart';
import 'package:todo_application/data/local_storage.dart';
import 'package:todo_application/data/service/notification_service.dart';
import 'package:todo_application/data/service/workmanger_service.dart';
import 'package:todo_application/data/sqflite.dart';
import 'package:todo_application/presentation/bloc/bloc_observer.dart';
import 'package:todo_application/presentation/bloc/task_bloc/task_bloc.dart';
import 'package:todo_application/presentation/pages/auth/on_boarding.dart';
import 'package:todo_application/presentation/pages/auth/splas_screen.dart';
import 'package:todo_application/presentation/pages/task/add_task.dart';
import 'package:todo_application/presentation/pages/task/completed_task.dart';
import 'package:todo_application/presentation/pages/task/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await initgetit();
  // /await setup();
  await Future.wait(
      [LocalNotifationService.init(), WorkMangerSarvice().init()]);
  await getIt<Sqflite>().initDb();
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => TaskBloc(context),
          child: MaterialApp(
            theme: darktheme,
            // BlocProvider.of<TaskBloc>(context).isDark?
            // : LightTheme(),
            // darkTheme: darktheme,
            // themeMode: ThemeMode.system,
            // BlocProvider.of<TaskBloc>(context).isDark
            //     ? ThemeMode.dark
            //     : ThemeMode.light,
            debugShowCheckedModeBanner: false,
          
            home: const SplashScreen(),
            routes: {
              'onBorading': (context) => OnBoaringScreens(),
              'homepage': (context) => HomePage(),
              'addtask': (context) => AddTask(),
              'completed': (context) => CompletedTaskPage(),
            },
          ),
        );
      },
    );
  }
}
