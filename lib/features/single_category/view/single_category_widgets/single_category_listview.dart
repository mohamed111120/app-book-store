import 'package:book_store/core/utils/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home_layout/model/ProductsDetails.dart';
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
              return ProductWidget(
                product: SingleCategoryCubit
                    .get(context)
                    .categoryProducts?[index] ?? ProductsDetails(),

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
