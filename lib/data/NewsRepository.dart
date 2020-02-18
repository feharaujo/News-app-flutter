import 'package:http/http.dart' as http;
import 'package:news_app/data/Constants.dart';
import 'package:news_app/model/response.dart';

class NewsRepository {

  var _authorizationHeader = {authHeader: authKey};

  Future<Response> fetchNews() async {
    final fullUrl = baseUrl + topHeadlinesEndpoint;
    var httpResponse = await http.get(fullUrl, headers: _authorizationHeader);
    if (httpResponse.statusCode == 200) {
      return Response.fromJson(httpResponse.body);
    } else {
      throw Exception("Error fetching data");
    }
  }

}
