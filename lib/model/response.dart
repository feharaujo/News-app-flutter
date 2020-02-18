library response;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:news_app/model/article.dart';
import 'serializers.dart';

part 'response.g.dart';

abstract class Response implements Built<Response, ResponseBuilder> {
  // fields go here
  String get status;
  int get totalResults;
  BuiltList<Article> get articles;

  Response._();

  factory Response([updates(ResponseBuilder b)]) = _$Response;

  String toJson() {
    return json.encode(serializers.serializeWith(Response.serializer, this));
  }

  static Response fromJson(String jsonString) {
    return serializers.deserializeWith(Response.serializer, json.decode(jsonString));
  }

  static Serializer<Response> get serializer => _$responseSerializer;
}