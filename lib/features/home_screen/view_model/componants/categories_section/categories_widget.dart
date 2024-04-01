import 'package:book_store/core/utils/custom_navigator.dart';
import 'package:book_store/features/home_screen/model/categories_model/categories_model.dart';
import 'package:book_store/features/single_category/view/single_category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/widgets/custom_text.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key, required this.category,
  });
final Categories category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CustomNavigator.push(context, SingleCategory(id: category.id??0,));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  height: 120.h,
                  width: 130.w,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqQMwq_mZ2I9qpXPhmIeJ5on2jZTavrF65Kw&ss',
                    fit: BoxFit.cover,
                  ),
                ),
                CustomText(

                  text: category.name??'',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
