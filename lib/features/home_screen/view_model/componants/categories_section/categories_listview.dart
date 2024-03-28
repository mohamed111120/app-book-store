import 'package:book_store/features/home_screen/view_model/componants/categories_section/categories_widget.dart';
import 'package:book_store/features/home_screen/view_model/home_cubits/categories_cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return SizedBox(
          height: 120.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoriesWidget(
                category: CategoriesCubit
                    .get(context)
                    .categoriesList[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox();
            },
            itemCount: CategoriesCubit
                .get(context)
                .categoriesList.length,
          ),
        );
      },
    );
  }
}
