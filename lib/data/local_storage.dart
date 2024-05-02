import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_application/data/sqflite.dart';



 final GetIt getItSql = GetIt.instance;
final getIt = GetIt.instance;
initgetit() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
   getIt.registerLazySingleton<Sqflite>(() => Sqflite());
}

