library article;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:news_app/model/serializers.dart';
import 'package:news_app/model/source.dart';

part 'article.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {

  @nullable
  Source get source;

  @nullable
  String get author;
  @nullable
  String get title;
  @nullable
  String get description;
  @nullable
  String get url;
  @nullable
  String get urlToImage;
  @nullable
  String get publishedAt;
  @nullable
  String get content;

  Article._();

  factory Article([updates(ArticleBuilder b)]) = _$Article;

  String toJson() {
    return json.encode(serializers.serializeWith(Article.serializer, this));
  }

  static Article fromJson(String jsonString) {
    return serializers.deserializeWith(Article.serializer, json.decode(jsonString));
  }

  static Serializer<Article> get serializer => _$articleSerializer;
}