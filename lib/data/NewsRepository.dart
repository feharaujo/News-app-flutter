import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/data/Constants.dart';
import 'package:news_app/model/response.dart';

class NewsRepository {
  String _authKey;

  Future<Response> fetchNews() async {
    Map<String, String> _authorizationHeader = await _createAuthHeader();
    final fullUrl = baseUrl + topHeadlinesEndpoint;
    var httpResponse = await http.get(fullUrl, headers: _authorizationHeader);
    if (httpResponse.statusCode == 200) {
      return Response.fromJson(httpResponse.body);
    } else {
      return Future.error("Error fetching data");
    }
  }

  Future<Map<String, String>> _createAuthHeader() async {
    if (_authKey == null || _authKey.isEmpty) {
      _authKey = await getAuthKey();
      if (_authKey.isEmpty) {
        Future.error("Error fetching the auth key");
      }
    }

    return {authHeader: _authKey};
  }

  Future<String> getAuthKey() async {
    RemoteConfig remoteConfig = await _getRemoteConfigInstance();
    return remoteConfig.getString(firebaseKey);
  }

  Future<RemoteConfig> _getRemoteConfigInstance() async {
    final remoteConfig = await RemoteConfig.instance;
    final defaults = <String, dynamic>{firebaseKey: ""};

    await remoteConfig.setDefaults(defaults);
    await remoteConfig.fetch(expiration: const Duration(hours: 24));
    await remoteConfig.activateFetched();
    return remoteConfig;
  }
}
