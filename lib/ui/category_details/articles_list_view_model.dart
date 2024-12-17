import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/articles_response/Article.dart';
import 'package:news_app/remote/api_manager.dart';

class ArticlesListViewModel extends Cubit<ArticlesListStata>{
  ArticlesListViewModel(): super(LoadingState()) ;
  getArticles(String sourceId)async
  {
    emit(LoadingState()) ;
   try {
      var response = await ApiManager.getArticles(sourceId);
      if (response?.status == "error") {
        emit(ErrorState(errMsg: response!.message!));
      }
      else{
        emit(SuccessState(response?.articles ?? []));
      }
    }
    catch(e)
    {
      emit(ErrorState(errMsg: e.toString())) ;
    }
  }
}

abstract class ArticlesListStata{}

class LoadingState extends ArticlesListStata{}
class ErrorState extends ArticlesListStata{
  final String errMsg;

  ErrorState({required this.errMsg});

}
class SuccessState extends ArticlesListStata{
  List<Article> articles ;
  SuccessState(this.articles) ;
}