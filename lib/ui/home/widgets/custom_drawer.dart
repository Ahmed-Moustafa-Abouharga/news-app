import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/app_styles/app_theme.dart';
import 'package:news_app/ui/categories/categories_widget.dart';
import 'package:news_app/ui/home/HomeScreen.dart';
import 'package:news_app/ui/settings/settings_widget.dart';

class CustomDrawer extends StatelessWidget {
   CustomDrawer({required this.onPress,});
  void Function(DrawerTabs) onPress ;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          padding: REdgeInsets.symmetric(vertical: 43),
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary
          ),
          child: Text("News App!",style: Theme.of(context).textTheme.headlineMedium,),
        ),
        SizedBox(height: 29.h,),
        InkWell(
          onTap:() {
            onPress(DrawerTabs.categories);
          },
          child: Padding(
            padding:  REdgeInsets.only(left: 16),
            child: Row(
              children: [
                SvgPicture.asset("assets/images/list_icon.svg",height:22.h ,width:25.w ,),
                SizedBox(width: 16.w,),
                Text("Categories",style: Theme.of(context).textTheme.titleMedium,)
              ],
            ),
          ),
        ),
        SizedBox(height: 23.h,),
        InkWell(
          onTap: ()
          {
            onPress(DrawerTabs.settings) ;
          },
          child: Padding(
            padding:  REdgeInsets.only(left: 16),
            child: Row(
              children: [
                SvgPicture.asset("assets/images/setting_icon.svg",height:22.h ,width:25.w ,),
                SizedBox(width: 16.w,),
                Text("Settings",style: Theme.of(context).textTheme.titleMedium,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
