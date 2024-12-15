import 'package:flutter/cupertino.dart';
import 'package:news_app/model/articles_response/Article.dart';
import 'package:news_app/model/articles_response/ArticlesResponse.dart';
import 'package:news_app/remote/api_manager.dart';

class ArticlesViewModel extends ChangeNotifier{
bool showLoading=false ;
String? errMsg ;
List<Article> articles  =[] ;
  getArticles(String sourceId)async
  {
   try {
     errMsg = null;
     articles = [] ;
     showLoading = true;
     notifyListeners();
      var response = await ApiManager.getArticles(sourceId);
      showLoading = false;
notifyListeners();
      if(response?.status=="error")
        {
          errMsg  = response!.message;
          notifyListeners();
        }
      else{
articles =response?.articles??[] ;
      }
      notifyListeners();
    }
    catch(e)
    {
      errMsg = e.toString();
      notifyListeners();
    }
  }
}