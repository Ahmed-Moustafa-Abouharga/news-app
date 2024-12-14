import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/search/search_screen.dart';
import 'package:news_app/ui/categories/categories_widget.dart';
import 'package:news_app/ui/category_details/category_details_widget.dart';
import 'package:news_app/ui/home/widgets/custom_drawer.dart';
import 'package:news_app/ui/settings/settings_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget  selectedWidget ;
String? category;
  @override
  void initState() {
    super.initState();
    selectedWidget = CategoriesWidget(onPress: showCategoryDetailsWidget) ;

  }
  String appBarTitle = "News App" ;
  IconData? icon ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          actions:[InkWell(
            onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(category: category??"",),),) ;
            },
              child: Padding(
                padding: REdgeInsets.all(20),
                child: Icon(icon,size: 27.sp,),
              )),],
        ),
        drawer: Drawer(
          child: CustomDrawer(
            onPress: selectDrawerItem,
          ),
        ),
        body: selectedWidget,
      ),
    );
  }

  selectDrawerItem(DrawerTabs value) {
    switch (value) {
      case DrawerTabs.categories:
        {
          selectedWidget = CategoriesWidget(onPress:showCategoryDetailsWidget,);
          Navigator.pop(context);
          setState(() {
            appBarTitle="News App" ;
          });
        }
      case DrawerTabs.settings:
        {
          selectedWidget = SettingsWidget();
          Navigator.pop(context);
          setState(() {});
        }
    }
  }
  showCategoryDetailsWidget(String category)
  {
    selectedWidget = CategoryDetailsWidget(category:category,) ;
    setState(() {
      appBarTitle = category;
      icon = Icons.search;
    });
    category = category;
  }
}
enum DrawerTabs {
  categories,
  settings,
}
