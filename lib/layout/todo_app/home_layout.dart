// ignore: unused_import
import 'package:bmi/modules/archived_tasks/archived_tasks_screen.dart';
// ignore: unused_import
import 'package:bmi/modules/done_tasks/done_tasks_screen.dart';
// ignore: unused_import
import 'package:bmi/modules/new_tasks/new_tasks_screen.dart';
import 'package:bmi/shared/components/components.dart';
import 'package:bmi/shared/cubit/cubit.dart';
// ignore: unused_import
import 'package:bmi/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
// ignore: unused_import
import 'package:sqflite/sqflite.dart';

// ignore: use_key_in_widget_constructors
// ignore: must_be_immutable
class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  //Database? database;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateCotroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldkey,
            appBar: AppBar(
              title: Text(cubit.title[cubit.currentindext]),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomsheetshown) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateCotroller.text,
                    );
                    titleController.clear();
                    timeController.clear();
                    dateCotroller.clear();
                  }
                } else {
                  scaffoldkey.currentState!
                      .showBottomSheet(
                        (context) {
                          return Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultformfield(
                                    controller: titleController,
                                    type: TextInputType.text,
                                    vlidate: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'title must be not empty';
                                      }
                                      return null;
                                    },
                                    label: 'task title',
                                    prefix: Icons.title,
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  defaultformfield(
                                      controller: timeController,
                                      type: TextInputType.datetime,
                                      ontap: () {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((value) {
                                          timeController.text =
                                              value!.format(context).toString();
                                          // ignore: avoid_print
                                          print(value.format(context));
                                        });
                                      },
                                      vlidate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'time must be not empty';
                                        }
                                        return null;
                                      },
                                      label: 'task time',
                                      prefix: Icons.watch_later_outlined),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  defaultformfield(
                                      controller: dateCotroller,
                                      type: TextInputType.datetime,
                                      ontap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse('2022-12-03'),
                                        ).then((value) {
                                          dateCotroller.text =
                                              DateFormat.yMMMMd()
                                                  .format(value!);
                                          // ignore: avoid_print
                                          print(dateCotroller.text);
                                        });
                                      },
                                      vlidate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'date must be not empty';
                                        }
                                        return null;
                                      },
                                      label: 'task date',
                                      prefix: Icons.calendar_today),
                                ],
                              ),
                            ),
                          );
                        },
                        elevation: 20.0,
                      )
                      .closed
                      .then((value) {
                        cubit.ChangeBottomSheetState(
                            isShow: false, icon: Icons.edit);
                      });
                  cubit.ChangeBottomSheetState(isShow: true, icon: Icons.add);
                }
              },
              child: Icon(cubit.fabicon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentindext,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Tasks',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.check),
                  label: 'Done',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'archived',
                ),
              ],
            ),
            body: cubit.screens[cubit.currentindext],
          );
        },
      ),
    );
  }
}
