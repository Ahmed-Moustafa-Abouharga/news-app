import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/DI/di.dart';
import 'package:news_app/app_styles/app_theme.dart';
import 'package:news_app/data/data_source_impl/SourcesDaoImpl.dart';
import 'package:news_app/data/repository_impl/SourcesRepoImpl.dart';
import 'package:news_app/remote/api_manager.dart';
import 'package:news_app/ui/category_details/article_list.dart';
import 'package:news_app/ui/category_details/categories_details_view_model.dart';

import '../../model/sources_resposnse/Sources.dart';

class CategoryDetailsWidget extends StatefulWidget {
  CategoryDetailsWidget({
    super.key,
    required this.category,
  });
  final String category;
  @override
  State<CategoryDetailsWidget> createState() => _CategoryDetailsWidgetState();
}

class _CategoryDetailsWidgetState extends State<CategoryDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>getIt.get<CategoryDetailsViewModel>()..getSources(widget.category),
      child: BlocBuilder<CategoryDetailsViewModel, CategoryDetailsState>(
        builder: (context, state) {
          if (state is SuccessState) {
            List<Source>? sources = state.sources;
            return DefaultTabController(
                length: sources.length,
                child: Padding(
                  padding: REdgeInsets.all(16),
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        indicator: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        dividerHeight: 0,
                        labelColor: Colors.white,
                        tabs: sources
                            .map(
                              (source) => Tab(
                                child: Container(
                                  padding: REdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 7,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    borderRadius: BorderRadius.circular(25.r),
                                  ),
                                  child: Text(source.name ?? ""),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      Expanded(
                          child: TabBarView(
                              children: sources
                                  .map(
                                    (source) => ArticlesList(
                                      sourceId: source.id ?? "",
                                    ),
                                  )
                                  .toList()))
                    ],
                  ),
                ));
          }
          if (state is ErrorState) {
            return Column(
              children: [
                Text(state.errMsg),
                ElevatedButton(onPressed: () {}, child: Text("Try Again"))
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
    /* return FutureBuilder(
        future: ApiManager.getSources(widget.category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text("Try again"))
              ],
            );
          }
          var response = snapshot.data;
          if (response?.status == "error") {
            return Column(
              children: [
                Text(response?.message ?? ""),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text("Try again"),
                )
              ],
            );
          }
         List<Source>? sources = response?.sources ?? [];
          return DefaultTabController(
              length: sources.length,
              child: Padding(
                padding: REdgeInsets.all(16),
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      indicator: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      dividerHeight: 0,
                      labelColor: Colors.white,
                      tabs: sources
                          .map(
                            (source) => Tab(
                              child: Container(
                                padding: REdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 7,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  borderRadius: BorderRadius.circular(25.r),
                                ),
                                child: Text(source.name ?? ""),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    Expanded(
                        child: TabBarView(
                            children: sources
                                .map(
                                  (source) => ArticlesList(
                                    sourceId: source.id ?? "",
                                  ),
                                )
                                .toList()))
                  ],
                ),
              ));
        });*/
  }
}
