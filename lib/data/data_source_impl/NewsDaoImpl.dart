import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/data_source/NewsDao.dart';
import 'package:news_app/model/articles_response/Article.dart';
import 'package:news_app/remote/api_manager.dart';
@Injectable(as: NewsDao)
class NewsApiDaoImpl extends NewsDao {
  ApiManager apiManager;
  @factoryMethod
  NewsApiDaoImpl(this.apiManager) ;
  @override
  Future<Either<List<Article>, String>> getArticles(String sourceId)async {
  var response=  await apiManager.getArticles(sourceId);
  if(response?.status=="error")
    {
      return Right(response?.message??"") ;
    }
  else {
    return left(response?.articles??[]) ;
  }
  }

}