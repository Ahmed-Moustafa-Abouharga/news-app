import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/ui/category_details/article_item.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.all(26.0),
      child: ListView.separated(
          itemBuilder: (context ,index)=>ArticleItem(articleModel:ArticleModel.articles[index],),
          separatorBuilder: (context , index)=>Divider(),
          itemCount:ArticleModel.articles.length ),
    );
  }
}
