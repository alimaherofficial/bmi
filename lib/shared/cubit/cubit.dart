import 'package:bloc/bloc.dart';
import 'package:bmi/modules/todo_app/archived_tasks/archived_tasks_screen.dart';
import 'package:bmi/modules/todo_app/done_tasks/done_tasks_screen.dart';
import 'package:bmi/modules/todo_app/new_tasks/new_tasks_screen.dart';
import 'package:bmi/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentindext = 0;
  //Database? database;
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivedtasks = [];

  List<Widget> screens = [
    const NewTaskscreen(),
    const DoneTaskscreen(),
    const ArchivedTaskscreen(),
  ];

  List<String> title = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void changeIndex(int index) {
    currentindext = index;
    emit(AppChangeBottomNavBarState());
  }

  Database? database;
  void createDatabase() {
    // ignore: unused_local_variable
    openDatabase('alimaher.db', version: 1, onCreate: (database, version) {
      // ignore: avoid_print
      print('database created');
      database
          .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
          .then((value) {
        // ignore: avoid_print
        print('table created');
      }).catchError((error) {
        // ignore: avoid_print
        print('error when crating table ${error.toString()}');
      });
    }, onOpen: (database) {
      getDataFromDatabase(database);
      // ignore: avoid_print
      print('database opened');
    }).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase({
    @required String? title,
    @required String? time,
    @required String? date,
  }) async {
    await database!.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO tasks(title, date, time, status)VALUES("$title","$time","$date","new")',
      )
          .then((value) {
        // ignore: avoid_print
        print('$value inserted done');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
      }).catchError((error) {
        // ignore: avoid_print
        print('isert error ${error.toString()}');
      });
    });
  }

  void getDataFromDatabase(database) {
    newtasks = [];
    donetasks = [];
    archivedtasks = [];

    emit(AppGetDatabaseLoadingState());
    database!.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newtasks.add(element);
        } else if (element['status'] == 'done') {
          donetasks.add(element);
        } else {
          archivedtasks.add(element);
        }
      });
      // ignore: avoid_print

      emit(AppGetDatabaseState());
    });
  }

  bool isBottomsheetshown = false;
  IconData fabicon = Icons.add;

  // ignore: non_constant_identifier_names
  void ChangeBottomSheetState({
    @required bool? isShow,
    @required IconData? icon,
  }) {
    isBottomsheetshown = isShow!;
    fabicon = icon!;
    emit(AppChangeBottomSheetState());
  }

  updateData({
    @required String? status,
    @required int? id,
  }) {
    database!.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        // ignore: unnecessary_string_interpolations
        ['$status', id]).then((value) {
      emit(AppUpdateDatabaseState());
      getDataFromDatabase(database);
    });
  }

  deleteData({
    @required int? id,
  }) {
    database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      emit(AppDeleteDatabaseState());
      getDataFromDatabase(database);
    });
  }

   bool isDark = false;

  void changeTheemMode() {
    isDark = !isDark;
    emit(AppChangeModesState());
  }
}
