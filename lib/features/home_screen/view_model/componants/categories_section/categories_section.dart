

import 'package:book_store/features/home_screen/view_model/componants/categories_section/categories_listview.dart';
import 'package:book_store/features/home_screen/view_model/home_cubits/categories_cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/widgets/custom_text.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {

  @override
  void initState() {
    CategoriesCubit.get(context).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.h , horizontal: 15.w),
          child: Row(
            children: [
              Expanded(
                  child: CustomText(text: 'Categories',fontSize: 20.sp,fontWeight: FontWeight.bold,)
              ),
              Icon(
                Icons.arrow_forward_outlined,
                size: 30.sp,
              ),
            ],
          ),
        ),
        CategoriesListView(),

      ],
    );
  }
}
