import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String title;
  String image;
  Color background;
  CategoryModel(
      {required this.title,
      required this.image,
      required this.background,
      required this.id});
 static List<CategoryModel> categories = [
    CategoryModel(id:"sports",title: "Sports", image: "sports.png", background: Color(0xffC91C22), ),
    CategoryModel(id:"general",title: "General", image: "Politics.png", background: Color(0xff003E90), ),
    CategoryModel(id:"health",title: "Health", image: "health.png", background: Color(0xffED1E79), ),
    CategoryModel(id:"business",title: "Business", image: "bussines.png", background: Color(0xffCF7E48), ),
    CategoryModel(id:"technology",title: "Technology", image: "environment.png", background: Color(0xff4882CF), ),
    CategoryModel(id:"science",title: "Science", image: "science.png", background: Color(0xffF2D352), ),
  ] ;
}
