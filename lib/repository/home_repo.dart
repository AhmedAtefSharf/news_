
import '../models/news_data_response.dart';
import '../models/source_response.dart';

abstract class HomeRepo {
  Future<SourceResponse> getSources(String catId);

  Future<NewsDataResponse> getNewsData(String sourceId);
}
