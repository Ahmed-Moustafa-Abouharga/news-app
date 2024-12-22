import 'package:dartz/dartz.dart';
import 'package:news_app/model/sources_resposnse/Sources.dart';

abstract class SourcesRepo{

 Future<Either<List<Source>,String>> getSources(String category) ;
}