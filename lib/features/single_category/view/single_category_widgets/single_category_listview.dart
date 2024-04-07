import 'package:book_store/features/single_category/model/single_category_model.dart';
import 'package:book_store/features/single_category/view/single_category_widgets/single_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/single_category_cubit/single_category_cubit.dart';

class SingleCategoryListView extends StatelessWidget {
  const SingleCategoryListView({super.key, });

  // final int id;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SingleCategoryCubit, SingleCategoryState>(
      builder: (context, state) {
        return ListView.builder(
            itemBuilder: (context, index) {
              return SingleCategoryWidget(
                categoryProducts: SingleCategoryCubit
                    .get(context)
                    .categoryProducts?[index] ?? CategoryProducts(),

              );
            },
            itemCount: SingleCategoryCubit
                .get(context)
                .categoryProducts?.length ??5,
          );


      },
    );
  }
}
