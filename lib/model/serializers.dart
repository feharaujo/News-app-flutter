library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/model/response.dart';
import 'package:news_app/model/source.dart';

part 'serializers.g.dart';

@SerializersFor(const [Response, Source, Article])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
