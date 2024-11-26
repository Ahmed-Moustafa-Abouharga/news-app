import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/app_styles/app_colors.dart';
import 'package:news_app/main.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24.sp,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24.sp,
        color: AppColors.iconColor,
      )
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
        size:35.sp,
      ),
      color: AppColors.lightPrimary,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(50.r) ,bottomRight:Radius.circular(50.r))
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,primary: AppColors.lightPrimary),
    scaffoldBackgroundColor: Colors.transparent,
    useMaterial3: true,
  );
}