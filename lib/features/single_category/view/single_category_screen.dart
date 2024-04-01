import 'package:book_store/core/utils/widgets/custom_app_bar.dart';
import 'package:book_store/features/single_category/view_model/single_category_cubit/single_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleCategory extends StatefulWidget {
  const SingleCategory({super.key, required this.id});

  final int id;

  @override
  State<SingleCategory> createState() => _SingleCategoryState();
}


class _SingleCategoryState extends State<SingleCategory> {

  @override
  void initState() {
    SingleCategoryCubit.get(context).getCategory(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleCategoryCubit, SingleCategoryState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(),
          body: Center(
            child: Text(SingleCategoryCubit.get(context).categoryProducts[1].description ??'sssss' ),
          ),
        );
      },
    );
  }
}
