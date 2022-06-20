import 'package:bmi/layout/news_app/cubit/cubit.dart';
import 'package:bmi/layout/todo_app/home_layout.dart';
import 'package:bmi/modules/bmi_app/bmi/bmi_screen.dart';
import 'package:bmi/network/remote/dio_helper.dart';
import 'package:bmi/shared/bloc_observer.dart';
import 'package:bmi/shared/cubit/cubit.dart';
import 'package:bmi/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
  //   setWindowTitle('App title');
  //   setWindowMinSize(const Size(1500, 1000));
  //   setWindowMaxSize(const Size(1500, 1000));
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
//}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getBusiness()),
        BlocProvider(create: (context) => AppCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                backgroundColor: Colors.white,
                elevation: 20.0,
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                elevation: 0.0,
                // ignore: deprecated_member_use
                backwardsCompatibility: false,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                backgroundColor: HexColor('333739'),
                unselectedItemColor: Colors.white,
                elevation: 20.0,
              ),
              appBarTheme: AppBarTheme(
                backgroundColor: HexColor('333739'),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                elevation: 0.0,
                // ignore: deprecated_member_use
                backwardsCompatibility: false,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: AppCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light, // ignore: prefer_const_constructors
            home:  const BmiScreen(),
          );
        },
      ),
    );
  }
}
