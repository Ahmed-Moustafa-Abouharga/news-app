import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/model/articles_response/Article.dart';
import 'package:news_app/remote/api_manager.dart';
import 'package:news_app/repository/NewsRepo.dart';
@injectable
class ArticlesListViewModel extends Cubit<ArticlesListStata>{
  NewsRepo repo ;
  @factoryMethod
  ArticlesListViewModel(this.repo): super(LoadingState()) ;
  getArticles(String sourceId)async
  {
    emit(LoadingState()) ;
   try {
      var result = await  repo.getArticles(sourceId) ;
      result .fold(
              (articles)
          {
            emit(SuccessState(articles)) ;
          },
              (error)
          {
            emit(ErrorState(errMsg: error)) ;
          });
      // var response = await ApiManager.getArticles(sourceId);
      // if (response?.status == "error") {
      //   emit(ErrorState(errMsg: response!.message!));
      // }
      // else{
      //   emit(SuccessState(response?.articles ?? []));
      // }
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