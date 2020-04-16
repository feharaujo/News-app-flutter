import 'package:news_app/model/article.dart';

abstract class DashboardState {}

class LoadingState extends DashboardState {}

class ErrorState extends DashboardState {}

class EndLoading extends DashboardState {
  List<Article> articles;

  EndLoading(this.articles);
}

class SuccessState extends DashboardState {
  List<Article> articles;

  SuccessState(this.articles);
}
