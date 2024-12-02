import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/app_styles/app_theme.dart';
import 'package:news_app/model/article_model.dart';
import 'package:timeago/timeago.dart' as timeago;
class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          articleModel.image,
          width: double.infinity,
          height: 232.h,
          fit: BoxFit.cover,
        ),
        Text(articleModel.source),
        Text(articleModel.title),
        Align(alignment: Alignment.bottomRight,
          child: Text(timeago.format(articleModel.date)),
        ),
      ],
    );
  }
}
