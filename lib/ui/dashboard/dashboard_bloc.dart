import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/NewsRepository.dart';
import 'package:news_app/ui/dashboard/dashboard_events.dart';
import 'package:news_app/ui/dashboard/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final NewsRepository _repository;

  DashboardBloc(this._repository) : assert(_repository != null);

  @override
  DashboardState get initialState => LoadingState();

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    yield LoadingState();

    if (event is FetchData) {
      try {
        var articles = await _repository.fetchNews();
        yield SuccessState(articles);
      } on NetworkError {
        yield ErrorState();
      }
    }
  }
}
