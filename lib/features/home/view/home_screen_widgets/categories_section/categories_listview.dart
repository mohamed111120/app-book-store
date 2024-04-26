import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/custom_navigator.dart';
import '../../../../single_category/view/single_category_screen.dart';
import '../../../../single_category/view_model/single_category_cubit/single_category_cubit.dart';
import '../../../view_model/home_cubits/categories_cubit/categories_cubit.dart';
import 'categories_widget.dart';

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
                onTap: () {
                  SingleCategoryCubit.get(context).getCategoryProducts(CategoriesCubit
                      .get(context)
                      .categoriesList[index].id!.toInt());
                  CustomNavigator.push(context, const SingleCategory());
                },
                category: CategoriesCubit
                    .get(context)
                    .categoriesList[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
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
