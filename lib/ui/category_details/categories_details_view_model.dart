import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/model/sources_resposnse/Sources.dart';
import 'package:news_app/remote/api_manager.dart';
import 'package:news_app/repository/SourcesRepo.dart';
@injectable
class CategoryDetailsViewModel extends Cubit<CategoryDetailsState>{
  SourcesRepo repo ;
  @factoryMethod
  CategoryDetailsViewModel(this.repo):super(LoadingState());
getSources(String category)async
{
  try{
 var result=  await repo.getSources(category) ;
 result.fold(
         (sources)
     {
       emit(SuccessState(sources)) ;
     },
         (error)
     {
       emit(ErrorState(error)) ;
     }) ;
    // emit(LoadingState()) ;
    //   var response = await ApiManager.getSources(category);
    //   if(response?.status == "error")
    //     {
    //       emit(ErrorState(response!.message!)) ;
    //     }
    //   emit(SuccessState(response?.sources??[])) ;
    }
    catch(e)
  {
    emit(ErrorState(e.toString())) ;
  }
  }
}


abstract class CategoryDetailsState{}

//class InitialState extends CategoryDetailsState{}

class LoadingState extends CategoryDetailsState{}

class ErrorState extends CategoryDetailsState{
  String errMsg ;
  ErrorState(this.errMsg) ;
}

class SuccessState extends CategoryDetailsState{
  List<Source> sources;
  SuccessState(this.sources) ;
}