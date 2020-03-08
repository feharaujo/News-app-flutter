import 'package:news_app/model/article.dart';

class DashboardBlocState {
  UiState uiState;

  DashboardBlocState._();

  factory DashboardBlocState.initial() {
    return DashboardBlocState._()..uiState = Loading();
  }
}

abstract class UiState {}

class Loading extends UiState {}

class Error extends UiState {}

class Success extends UiState {
  List<Article> articles;

  Success(this.articles);
}
