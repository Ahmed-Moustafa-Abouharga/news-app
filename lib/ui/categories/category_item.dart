import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/app_styles/app_theme.dart';
import 'package:news_app/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.categoryModel,
      required this.index,
      required this.onPress});
  final int index;
  final CategoryModel categoryModel;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Container(
        decoration: BoxDecoration(
            color: categoryModel.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
              bottomRight:
                  index.isEven ? Radius.circular(25.r) : Radius.circular(0),
              bottomLeft:
                  index.isOdd ? Radius.circular(25.r) : Radius.circular(0),
            )),
        child: Column(
          children: [
            Image.asset(
              'assets/images/${categoryModel.image}',
              height: 116.h,
              width: 132.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              categoryModel.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.w400, fontSize: 22.sp),
            ),
          ],
        ),
      ),
    );
  }
}
