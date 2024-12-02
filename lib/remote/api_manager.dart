import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/remote/constants.dart';
class ApiManager{
getSources(String category)async
{
  //https://newsapi.org/v2/top-headlines/sources?apiKey=1a2b28d061884fd8a9d021a3d3abcbd3
 try {
      Uri url = Uri.https(
          baseUrl, sourcesEndPoint, {"category": category, "apiKey": apiKey});
      var response = await http.get(
        url,
      );
   Map<String ,dynamic> json =    jsonDecode( response.body);
    }
    catch(error)
  {
    print(error.toString()) ;
  }
  }
}