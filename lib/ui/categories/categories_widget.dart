import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/categories/category_item.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key, required this.onPress});
 final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '''Pick your category 
 of interest''',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: 29.h,),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 25.w,
              ),
              itemBuilder: (BuildContext context, int index) {
                return CategoryItem(
                  categoryModel: CategoryModel.categories[index],
                  index: index, onPress: onPress,
                );
              },
              itemCount: CategoryModel.categories.length,
            ),
          )
        ],
      ),
    );
  }
}
