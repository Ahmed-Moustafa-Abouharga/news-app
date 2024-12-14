import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/articles_response/Article.dart';
import 'package:news_app/remote/api_manager.dart';

import '../ui/category_details/article_item.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key,required this.category});
  static const String routeName = "search";
String category;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"),),),
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: (value)
            {
              searchController.text = value;
              setState(() {

              });
            },
            controller: searchController,
            decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  color: Color(0xff39A552),
                ),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.sp),
                    borderSide: BorderSide(color: Colors.white)),
                prefixIcon: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.close,
                    color: Color(0xff39A552),
                  ),
                ),
                hintText: "Search Aritcle",
                hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff39A552).withOpacity(0.2),
                    ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.sp),
                  borderSide: BorderSide(color: Colors.white),
                )),
          ),
        ),
        body: FutureBuilder(
          future: ApiManager.search(searchController.text,widget.category),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child:CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Column(
                children: [
                  Text(snapshot.error.toString()),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text("Try again"),
                  )
                ],
              );
            }
            var response = snapshot.data;
            if(response?.status =="error")
              {
                return Column(
                  children: [
                    Text(response!.message!) ,
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text("Try again"),
                    ),
                  ],
                ) ; 
              }
            List<Article>? articles = response?.articles??[];
            print(articles) ;
            print(response?.message) ;
            print( response?.status) ;
            return Padding(
              padding:  REdgeInsets.all(16.0),
              child: ListView.separated(
                  itemBuilder: (context,index)=>ArticleItem(article: articles[index],),
                  separatorBuilder:(context,index)=>const Divider() ,
                  itemCount:articles.length
              ),
            );
          },
        ),
      ),
    );
  }
}
