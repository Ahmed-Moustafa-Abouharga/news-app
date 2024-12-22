import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/data_source_impl/SourcesDaoImpl.dart';
import 'package:news_app/model/sources_resposnse/Sources.dart';
import 'package:news_app/repository/SourcesRepo.dart';
import '';
import '../data_source/SourcesDao.dart';
@Injectable(as: SourcesRepo)
class SourcesRepoImpl extends SourcesRepo{
  SourcesApiDao sourcesApiDao;
  @factoryMethod
  SourcesRepoImpl(this.sourcesApiDao) ;

  @override
  Future<Either<List<Source>, String>> getSources(String category) async {
    return sourcesApiDao.getSources(category) ;
  }

}