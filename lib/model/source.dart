library source;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:news_app/model/serializers.dart';

part 'source.g.dart';

abstract class Source implements Built<Source, SourceBuilder> {
  @nullable
  String get id;

  @nullable
  String get name;

  Source._();

  factory Source([updates(SourceBuilder b)]) = _$Source;

  String toJson() {
    return json.encode(serializers.serializeWith(Source.serializer, this));
  }

  static Source fromJson(String jsonString) {
    return serializers.deserializeWith(
        Source.serializer, json.decode(jsonString));
  }

  static Serializer<Source> get serializer => _$sourceSerializer;
}
