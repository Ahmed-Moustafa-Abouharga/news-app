import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/data_source/NewsDao.dart';
import 'package:news_app/model/articles_response/Article.dart';
import 'package:news_app/repository/NewsRepo.dart';
@Injectable(as: NewsRepo)
class NewsRepoImpl extends NewsRepo{

  NewsDao newsDao;
  @factoryMethod
  NewsRepoImpl(this.newsDao) ;
  @override
  Future<Either<List<Article>, String>> getArticles(String sourceId)async {
   var result = await newsDao.getArticles(sourceId) ;
   return result;
  }

}