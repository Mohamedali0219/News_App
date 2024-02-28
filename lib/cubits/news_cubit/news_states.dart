abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavstate extends NewsStates {}

class NewsBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  String? error;
  NewsGetBusinessErrorState(this.error);
}

class NewsSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  String? error;
  NewsGetSportsErrorState(this.error);
}

class NewsScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  String? error;
  NewsGetScienceErrorState(this.error);
}

class NewsSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  String? error;
  NewsGetSearchErrorState(this.error);
}
