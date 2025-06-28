import 'package:dio/dio.dart';

import '../model/news_model.dart';

class NewsService {
  static Dio dio = Dio();

  static Future<NewsModel> fetchData({required String category}) async {
    var apiKey = "569d690cc8544d7492aab5d5b78bd276";
    Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey");
    if (response.statusCode == 200) {
      return NewsModel.fromJson(response.data);
    } else {
      throw Exception("Failed to load data");
    }
  }
}
