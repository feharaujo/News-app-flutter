// GENERATED CODE - DO NOT MODIFY BY HAND

part of response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Response> _$responseSerializer = new _$ResponseSerializer();

class _$ResponseSerializer implements StructuredSerializer<Response> {
  @override
  final Iterable<Type> types = const [Response, _$Response];
  @override
  final String wireName = 'Response';

  @override
  Iterable<Object> serialize(Serializers serializers, Response object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'totalResults',
      serializers.serialize(object.totalResults,
          specifiedType: const FullType(int)),
      'articles',
      serializers.serialize(object.articles,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Article)])),
    ];

    return result;
  }

  @override
  Response deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'totalResults':
          result.totalResults = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'articles':
          result.articles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Article)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$Response extends Response {
  @override
  final String status;
  @override
  final int totalResults;
  @override
  final BuiltList<Article> articles;

  factory _$Response([void Function(ResponseBuilder) updates]) =>
      (new ResponseBuilder()..update(updates)).build();

  _$Response._({this.status, this.totalResults, this.articles}) : super._() {
    if (status == null) {
      throw new BuiltValueNullFieldError('Response', 'status');
    }
    if (totalResults == null) {
      throw new BuiltValueNullFieldError('Response', 'totalResults');
    }
    if (articles == null) {
      throw new BuiltValueNullFieldError('Response', 'articles');
    }
  }

  @override
  Response rebuild(void Function(ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseBuilder toBuilder() => new ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Response &&
        status == other.status &&
        totalResults == other.totalResults &&
        articles == other.articles;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, status.hashCode), totalResults.hashCode),
        articles.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Response')
          ..add('status', status)
          ..add('totalResults', totalResults)
          ..add('articles', articles))
        .toString();
  }
}

class ResponseBuilder implements Builder<Response, ResponseBuilder> {
  _$Response _$v;

  String _status;

  String get status => _$this._status;

  set status(String status) => _$this._status = status;

  int _totalResults;

  int get totalResults => _$this._totalResults;

  set totalResults(int totalResults) => _$this._totalResults = totalResults;

  ListBuilder<Article> _articles;

  ListBuilder<Article> get articles =>
      _$this._articles ??= new ListBuilder<Article>();

  set articles(ListBuilder<Article> articles) => _$this._articles = articles;

  ResponseBuilder();

  ResponseBuilder get _$this {
    if (_$v != null) {
      _status = _$v.status;
      _totalResults = _$v.totalResults;
      _articles = _$v.articles?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Response other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Response;
  }

  @override
  void update(void Function(ResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Response build() {
    _$Response _$result;
    try {
      _$result = _$v ??
          new _$Response._(
              status: status,
              totalResults: totalResults,
              articles: articles.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'articles';
        articles.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Response', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
