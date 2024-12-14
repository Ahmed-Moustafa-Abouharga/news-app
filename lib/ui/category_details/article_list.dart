import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/articles_response/ArticlesResponse.dart';
import 'package:news_app/remote/api_manager.dart';
import 'package:news_app/ui/category_details/article_item.dart';

import '../../model/articles_response/Article.dart';

class ArticlesList extends StatefulWidget {
   ArticlesList({required this.sourceId});
  String sourceId;

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:ApiManager.getArticles(widget.sourceId,), builder: (context, snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting)
        {
          return Center(child: CircularProgressIndicator(),);
        }
      if(snapshot.hasError)
        {
          return Column(
            children: [
              Text(snapshot.error.toString()),
              ElevatedButton(onPressed: (){
                setState(() {

                });
              }, child: Text("Try again"),)
            ],
          ) ;
        }
      var response = snapshot.data;
      if(response?.status =="error")
        {
          return Column(
            children: [
              Text(response?.message??""),
              ElevatedButton(onPressed: (){
                setState(() {

                });
              }, child: Text("Try again"),)
            ],
          );
        }
      List<Article>? articles = response?.articles??[];
     return Padding(
       padding:  REdgeInsets.all(16.0),
       child: ListView.separated(
           itemBuilder: (context,index)=>ArticleItem(article: articles[index],),
           separatorBuilder:(context,index)=>Divider() ,
           itemCount:articles.length
       ),
     );
    } ,);
  }


}
