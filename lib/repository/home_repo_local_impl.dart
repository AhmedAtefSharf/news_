import 'dart:convert';


import 'package:http/http.dart' as http;

import '../cache_helper.dart';
import '../models/news_data_response.dart';
import '../models/source_response.dart';
import 'home_repo.dart';

class HomeRepoLocalImpl implements HomeRepo {
  @override
  Future<NewsDataResponse> getNewsData(String sourceId) async {
    return await HiveService.getNewsResponse();
  }

  @override
  Future<SourceResponse> getSources(String catId) async {
    return await HiveService.getSourcesResponse();
  }
}
