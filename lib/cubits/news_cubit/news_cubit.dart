import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/news_cubit/news_states.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/settings_screen.dart';
import 'package:news_app/screens/sports_screen.dart';
import 'package:news_app/service/remote_service/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItem = const [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'bussiness'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings')
  ];

  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen()
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsBottomNavstate());
  }

  //! request => https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=43127776c8d4446ea91a1c6619eb228d

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '43127776c8d4446ea91a1c6619eb228d',
    }).then(
      (value) {
        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      },
    ).catchError((error) {
      print(error);
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': '43127776c8d4446ea91a1c6619eb228d',
      }).then(
        (value) {
          sports = value.data['articles'];
          emit(NewsGetSportsSuccessState());
        },
      ).catchError((error) {
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '43127776c8d4446ea91a1c6619eb228d',
      }).then(
        (value) {
          science = value.data['articles'];
          emit(NewsGetScienceSuccessState());
        },
      ).catchError((error) {
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

//! search request => https://newsapi.org/v2/everything?q=apple&apiKey=43127776c8d4446ea91a1c6619eb228d
  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsSearchLoadingState());

    DioHelper.getData(url: 'v2/everything', query: {
      'q': value,
      'apiKey': '43127776c8d4446ea91a1c6619eb228d',
    }).then(
      (value) {
        search = value.data['articles'];

        emit(NewsGetSearchSuccessState());
      },
    ).catchError((error) {
      emit(
        NewsGetSearchErrorState(
          error.toString(),
        ),
      );
    });
  }
}
