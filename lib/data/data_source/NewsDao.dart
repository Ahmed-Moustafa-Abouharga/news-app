import 'package:dartz/dartz.dart';
import 'package:news_app/model/articles_response/Article.dart';

abstract class NewsDao {
 Future<Either<List<Article>,String>> getArticles(String sourceId);
}