import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/data_source/SourcesDao.dart';
import 'package:news_app/model/sources_resposnse/Sources.dart';
import 'package:news_app/remote/api_manager.dart';
@Injectable(as: SourcesApiDao)
class SourcesApiDaoImpl extends SourcesApiDao{
  ApiManager apiManager ;
  @factoryMethod
  SourcesApiDaoImpl(this.apiManager) ;  // constructor injection
  @override
  Future<Either<List<Source>,String>> getSources(String category)async {
   var response =await  apiManager.getSources(category) ;
   if(response?.status =="error")
     {
       return Right(response?.message??"") ;
     }
   else{
     return left(response?.sources??[]) ;
   }
  }

}