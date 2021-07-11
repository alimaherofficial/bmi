import 'package:bmi/layout/news_app/cubit/states.dart';
import 'package:bmi/modules/business/business.dart';
import 'package:bmi/modules/science/science.dart';
import 'package:bmi/modules/sports/sports.dart';
import 'package:bmi/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_basketball_outlined),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
    // const BottomNavigationBarItem(
    //   icon: Icon(Icons.settings),
    //   label: 'Settings',
    // ),
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    // const SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (currentIndex == 1) {
      getSports();
    } else if (currentIndex == 2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessloadingState());
    if (business.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'a125c5fc5d0b41e7b7e8c537328d34e2',
      }).then((value) {
        // ignore: avoid_print
        print(value.data['articles'][0]['title']);
        business = value.data['articles'];
        // ignore: avoid_print
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        // ignore: avoid_print
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsloadingState());
    if (sports.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'a125c5fc5d0b41e7b7e8c537328d34e2',
      }).then((value) {
        // ignore: avoid_print
        print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        // ignore: avoid_print
        print(business[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        // ignore: avoid_print
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceloadingState());
    if (science.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'a125c5fc5d0b41e7b7e8c537328d34e2',
      }).then((value) {
        // ignore: avoid_print
        print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        // ignore: avoid_print
        print(business[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        // ignore: avoid_print
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    search = [];
    emit(NewsGetSearchloadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      // ignore: unnecessary_string_interpolations
      'q': '$value',
      'from': '2021-06-11',
      'sortBy': 'publishedAt',
      'apiKey': 'a125c5fc5d0b41e7b7e8c537328d34e2',
    }).then((value) {
      // ignore: avoid_print
      print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      // ignore: avoid_print
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
