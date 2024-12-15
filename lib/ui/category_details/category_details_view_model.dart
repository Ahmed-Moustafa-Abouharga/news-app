import 'package:flutter/cupertino.dart';
import 'package:news_app/model/sources_resposnse/Sources.dart';
import 'package:news_app/model/sources_resposnse/SourcesResponse.dart';
import 'package:news_app/remote/api_manager.dart';
import 'package:news_app/remote/constants.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  bool showLoading = false ;
  String? errMsg ;
  List<Source> sources=[];
  getSources(String category)async
  {

 try{
   errMsg = null;
   sources= [] ;
   showLoading = true  ;
   notifyListeners();
   var sourceResponse= await ApiManager.getSources(category);
   showLoading = false;
   notifyListeners();
      if (sourceResponse?.status == "error") {
        // handle server error
        errMsg = sourceResponse?.message;
      } else {
        // handle logic of success
        showLoading = false;
        sources = sourceResponse?.sources??[];

      }
      notifyListeners();
 }
    catch(error)
    {
      errMsg = error.toString();
      showLoading =false;
      notifyListeners();
    }
  }
}