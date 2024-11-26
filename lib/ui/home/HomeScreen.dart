import 'package:flutter/material.dart';
import 'package:news_app/ui/home/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.fill),),
      child: Scaffold(
        appBar: AppBar(
          title: Text("News App"),
        ),
        drawer:Drawer(
          child: CustomDrawer(),
        ) ,
      ),
    );
  }
}
