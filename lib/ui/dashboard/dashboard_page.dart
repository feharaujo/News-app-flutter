import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/NewsRepository.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/ui/dashboard/dashboard_bloc.dart';
import 'package:news_app/ui/dashboard/dashboard_events.dart';
import 'package:news_app/ui/dashboard/dashboard_state.dart';
import 'package:news_app/ui/widget/ImageTextCell.dart';
import 'package:news_app/ui/widget/JustTextCell.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _bloc = DashboardBloc(NewsRepository());
  final _scrollController = ScrollController();
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();

    _refreshCompleter = Completer<void>();
    _bloc.add(FetchData());
    _registerScrollEvents();
  }

  void _registerScrollEvents() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _bloc.add(FetchData());
      }
    });
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News app"),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: BlocBuilder(
            bloc: _bloc,
            builder: (context, DashboardState state) {
              if (state is SuccessState) {
                _completeRefresh();
                return _getListViewWidget(state.articles);
              } else if (state is ErrorState) {
                return _getErrorWidget();
              } else {
                return _getProgressBar();
              }
            }),
      ),
    );
  }

  void _completeRefresh() {
    _refreshCompleter?.complete();
    _refreshCompleter = Completer();
  }

  Future<void> _refreshData() async {
    //refreshIndicatorState.currentState?.show(atTop: true);
    _bloc.add(RefreshData());
    return _refreshCompleter.future;
  }

  Widget _getListViewWidget(List<Article> articles) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: articles.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == articles.length) {
          return _getProgressBar();
        } else {
          return GestureDetector(
              onTap: () {
                _onItemTap(articles[index]);
              },
              child: _createCell(articles[index]));
        }
      },
    );
  }

  _onItemTap(Article article) async {
    final url = article.url;
    if (await canLaunch(url)) {
      launch(url);
    }
  }

  Widget _getProgressBar() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _getErrorWidget() {
    return GestureDetector(
      onTap: () {
        _bloc.add(FetchData());
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Error on fetching news.\nClick to try again",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            Icon(Icons.refresh)
          ],
        ),
      ),
    );
  }

  Widget _createCell(Article article) {
    if (article.urlToImage != null && article.urlToImage.isNotEmpty) {
      // Cell with image
      return ImageTextCell(
        image: Image(
          image: NetworkImage(_fixUrl(article.urlToImage)),
        ),
        title: article.title,
        source: article.source.name,
      );
    } else {
      // Cell with text and description
      return JustTextCell(
        title: article.title,
        description: article.description,
        content: article.content,
        source: article.source.name,
      );
    }
  }

  String _fixUrl(String url) {
    return url
        .replaceAll("https:////", "https://")
        .replaceAll("http:////", "http://");
  }
}
