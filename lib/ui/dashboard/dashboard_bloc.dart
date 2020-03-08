import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/NewsRepository.dart';
import 'package:news_app/model/response.dart';
import 'package:news_app/ui/dashboard/dashboard_state.dart';
import 'package:news_app/ui/dashboard/dashboard_events.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardBlocState> {

  final NewsRepository repository;

  DashboardBloc(this.repository) : assert(repository != null);

  @override
  DashboardBlocState get initialState => DashboardBlocState.initial();

  @override
  Stream<DashboardBlocState> mapEventToState(DashboardEvent event) async* {
    if (event is FetchData) {
      var articles = await repository.fetchNews();
      yield state..uiState = Success(articles);
    }
  }

}