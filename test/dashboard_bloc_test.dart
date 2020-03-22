import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/NewsRepository.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/ui/dashboard/dashboard_bloc.dart';
import 'package:news_app/ui/dashboard/dashboard_events.dart';
import 'package:news_app/ui/dashboard/dashboard_state.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

class MockArticles extends Mock implements List<Article> {}

void main() {
  MockNewsRepository mockRepository;
  MockArticles mockArticles;

  setUp(() {
    mockRepository = MockNewsRepository();
    mockArticles = MockArticles();
  });

  group('DashboardBloc tests', () {
    blocTest(
      "Should emits Initial, Loading and success events",
      build: () async {
        when(mockRepository.fetchNews()).thenAnswer((_) async => mockArticles);
        return DashboardBloc(mockRepository);
      },
      act: (bloc) => bloc.add(FetchData()),
      expect: [isA<LoadingState>(), isA<SuccessState>()],
    );

    blocTest(
      "Should emits NetworkError on connection failure",
      build: () async {
        when(mockRepository.fetchNews()).thenThrow(NetworkError());
        return DashboardBloc(mockRepository);
      },
      act: (bloc) => bloc.add(FetchData()),
      expect: [isA<LoadingState>(), isA<ErrorState>()],
    );
  });
}
