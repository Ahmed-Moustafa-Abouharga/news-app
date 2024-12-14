import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/app_styles/app_theme.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/articles_response/Article.dart';
import 'package:news_app/ui/category_details/full_article_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullArticleScreen(article: article),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: article.urlToImage ?? "",
            width: double.infinity,
            height: 232.h,
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              size: 40.sp,
            ),
          ),
          Text(article.source?.name ?? ""),
          Text(article.title ?? ""),
          Align(
            alignment: Alignment.bottomRight,
            child:
                Text(timeago.format(DateTime.parse(article.publishedAt ?? ""))),
          ),
        ],
      ),
    );
  }
}
