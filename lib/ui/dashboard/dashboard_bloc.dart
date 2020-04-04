import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/NewsRepository.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/ui/dashboard/dashboard_events.dart';
import 'package:news_app/ui/dashboard/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final NewsRepository _repository;
  int _page = 1;
  List<Article> _allArticles = List();

  DashboardBloc(this._repository) : assert(_repository != null);

  @override
  DashboardState get initialState => LoadingState();

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is FetchData) {
      try {
        var articles = await _repository.fetchNews(_page);
        _allArticles.addAll(articles);
        yield SuccessState(_allArticles);
        increasePageNumber();
      } on NetworkError {
        yield ErrorState();
      }
    }
  }

  void increasePageNumber() {
    _page++;
  }
}
