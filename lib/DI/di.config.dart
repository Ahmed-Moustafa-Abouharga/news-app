// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/data_source/NewsDao.dart' as _i1017;
import '../data/data_source/SourcesDao.dart' as _i1035;
import '../data/data_source_impl/NewsDaoImpl.dart' as _i395;
import '../data/data_source_impl/SourcesDaoImpl.dart' as _i883;
import '../data/repository_impl/NewsApiRepoImpl.dart' as _i0;
import '../data/repository_impl/SourcesRepoImpl.dart' as _i687;
import '../remote/api_manager.dart' as _i822;
import '../repository/NewsRepo.dart' as _i328;
import '../repository/SourcesRepo.dart' as _i550;
import '../ui/category_details/articles_list_view_model.dart' as _i1053;
import '../ui/category_details/categories_details_view_model.dart' as _i1062;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i822.ApiManager>(() => _i822.ApiManager());
    gh.factory<_i1035.SourcesApiDao>(
        () => _i883.SourcesApiDaoImpl(gh<_i822.ApiManager>()));
    gh.factory<_i1017.NewsDao>(
        () => _i395.NewsApiDaoImpl(gh<_i822.ApiManager>()));
    gh.factory<_i328.NewsRepo>(() => _i0.NewsRepoImpl(gh<_i1017.NewsDao>()));
    gh.factory<_i1053.ArticlesListViewModel>(
        () => _i1053.ArticlesListViewModel(gh<_i328.NewsRepo>()));
    gh.factory<_i550.SourcesRepo>(
        () => _i687.SourcesRepoImpl(gh<_i1035.SourcesApiDao>()));
    gh.factory<_i1062.CategoryDetailsViewModel>(
        () => _i1062.CategoryDetailsViewModel(gh<_i550.SourcesRepo>()));
    return this;
  }
}
