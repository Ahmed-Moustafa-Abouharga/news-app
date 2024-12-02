import 'package:flutter/material.dart';
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
  late Widget selectedWidget ;
  @override
  void initState() {
    super.initState();
    selectedWidget = CategoriesWidget(onPress: showCategoryDetailsWidget) ;
  }
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
          title: const Text("News App"),
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
          setState(() {});
        }
      case DrawerTabs.settings:
        {
          selectedWidget = SettingsWidget();
          Navigator.pop(context);
          setState(() {});
        }
    }
  }
  showCategoryDetailsWidget()
  {
    selectedWidget = CategoryDetailsWidget() ;
    setState(() {

    });
  }
}

enum DrawerTabs {
  categories,
  settings,
}
