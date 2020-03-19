import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/NewsRepository.dart';
import 'package:news_app/ui/dashboard/dashboard_events.dart';
import 'package:news_app/ui/dashboard/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final NewsRepository repository;

  DashboardBloc(this.repository) : assert(repository != null);

  @override
  DashboardState get initialState => LoadingState();

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is FetchData) {
      var articles = await repository.fetchNews();
      yield SuccessState(articles);
    }
  }
}
