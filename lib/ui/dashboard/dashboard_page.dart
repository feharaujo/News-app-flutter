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

  @override
  void initState() {
    super.initState();

    _bloc.add(FetchData());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: DashboardWidget(widget: widget),
    );
  }
}

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final DashboardPage widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News app"),
      ),
      body: BlocBuilder(
          bloc: BlocProvider.of<DashboardBloc>(context),
          builder: (context, DashboardState state) {
            if (state is SuccessState) {
              return _getListViewWidget(state.articles);
            } else {
              return _getProgressBar();
            }
          }),
    );
  }

  Widget _getListViewWidget(List<Article> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
              _onItemTap(articles[index]);
            },
            child: _createCell(articles[index]));
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
      child: CircularProgressIndicator(),
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