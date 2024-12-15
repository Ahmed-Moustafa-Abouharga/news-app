import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/articles_response/ArticlesResponse.dart';
import 'package:news_app/model/sources_resposnse/SourcesResponse.dart';
import 'package:news_app/remote/constants.dart';

class ApiManager {
static Future<SourcesResponse?> getSources(String category) async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=1a2b28d061884fd8a9d021a3d3abcbd3

      Uri url = Uri.https(baseUrl, sourcesEndPoint, {
        "category": category,
        "apiKey": apiKey,
      });
      var response = await http.get(
        url,
      );
      Map<String, dynamic> json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json) ;
    return sourcesResponse;

  }

  static Future<ArticlesResponse?> getArticles(String sourceId,)async
  {
    try{
      Uri url = Uri.https(baseUrl, articlesEndPoint, {
        'apiKey':apiKey,
        'sources':sourceId
      });
      var response = await http.get(url);
      Map<String, dynamic> json = jsonDecode(response.body);
      var articleResponse = ArticlesResponse.fromJson(json) ;
      return articleResponse;

    }
    catch(e)
    {
      print(e.toString()) ;
    }
  }
//https://newsapi.org/v2/everything?q=bitcoin&apiKey=1a2b28d061884fd8a9d021a3d3abcbd3&sources=wired

  static Future<ArticlesResponse?> search(String searchArticle,String category)async
  {
      Uri url = Uri.https(baseUrl, articlesEndPoint,
          {"q": searchArticle, "apiKey": apiKey,"category":category});
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var articleResponse = ArticlesResponse.fromJson(json);
      return articleResponse;


  }
}
