// ignore_for_file: avoid_print

import 'package:sqflite/sqflite.dart';
import 'package:todo_application/domain/model/task/task_model.dart';
 class Sqflite {

  late Database db;
  //!initDatabase
   initDb() async {
    //CREATE DB
    await openDatabase(
      'tasks.db',
      version: 1,
      onCreate: (db, version) async {
        //CREATE TABLE
        await db.execute('''
      CREATE TABLE Tasks(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      note TEXT,
      date TEXT,
      startTime TEXT,
      endTime TEXT,
      color INTEGER,
       isCompleted INTEGER )
       ''').then((value) => print('DB CREATE '));
      },
      onOpen: (db) {
        print('db open');
      },
    // ignore: body_might_complete_normally_catch_error
    ).then((value) => db = value).catchError((e) {
      print(e.toString());
    });
  }

  //!get
  Future<List<Map<String, Object?>>> getFormDB() async {
    return await db.rawQuery('SELECT * FROM Tasks');
  }

  //!insert
 Future<int> inserToDB(TaskModel model) async{
 return await db.rawInsert('''
    INSERT INTO Tasks(
      title,note, date, startTime, endTime, color, isCompleted
    ) VALUES (
      '${model.title}','${model.note}', '${model.date}',
      '${model.startTime}', '${model.endTime}', '${model.color}', '${model.isCompleted}'
    )
''');
  }
  //!update
  Future<int> updateDB(int id)async{
return await db.rawUpdate(''' 
UPDATE Tasks
SET isCompleted =  ?
WHERE id = ?
''',[1,id]);
  }
  //!delete Db
 Future<int> deleteFromDB(int id)async{
  return await  db.rawDelete('''
DELETE FROM Tasks WHERE id = ?

''',[id]);
  }
}
