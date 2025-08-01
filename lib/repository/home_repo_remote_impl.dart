import 'dart:convert';


import 'package:http/http.dart' as http;

import '../cache_helper.dart';
import '../models/news_data_response.dart';
import '../models/source_response.dart';
import 'home_repo.dart';

class HomeRepoRemoteImpl implements HomeRepo {
  @override
  Future<NewsDataResponse> getNewsData(String sourceId) async {
    Uri url = Uri.https("newsapi.org", "/v2/everything", {
      "apiKey": "dc3d106e730c4256b8c275d9da58d090",
      "sources": sourceId,
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(json);
    await HiveService.saveNewsResponse(newsDataResponse);
    print("News newsDataResponse  Saved on local DB");
    return newsDataResponse;
  }

  @override
  Future<SourceResponse> getSources(String catId) async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources", {
      "apiKey": "dc3d106e730c4256b8c275d9da58d090",
      "category": catId,
    });

    http.Response response = await http.get(url);

    var json = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    await HiveService.saveSourcesResponse(sourceResponse);
    print("News Sources Saved on local DB");
    return sourceResponse;
  }
}
