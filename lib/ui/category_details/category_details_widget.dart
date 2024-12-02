import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/app_styles/app_theme.dart';
import 'package:news_app/ui/category_details/article_list.dart';

class CategoryDetailsWidget extends StatelessWidget {
  CategoryDetailsWidget({super.key});
  List<String> sources = [
    "BBC news",
    "CNN",
    "CBC",
    "CBC",
    "CBC",
    "CBC",
    "CBC",
    "CBC"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sources.length,
      child: Padding(
        padding: REdgeInsets.only(top: 16),
        child: Column(
          children: [
            TabBar(
              indicator: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(25.r),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Theme.of(context).colorScheme.primary,
              dividerHeight: 0.0,
              // unselectedLabelStyle: ,
              isScrollable: true,
              tabs: sources
                  .map((source) => Tab(
                        child: Container(
                          padding: REdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary),
                              borderRadius: BorderRadius.circular(25.r)),
                          child: Text(source),
                        ),
                      ))
                  .toList(),
            ),
            Expanded(
              child: TabBarView(
              
                children: sources.map((source) => ArticlesList()).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
