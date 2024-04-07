import 'package:book_store/core/utils/widgets/custom_app_bar.dart';
import 'package:book_store/features/single_category/view/single_category_widgets/single_category_listview.dart';
import 'package:flutter/material.dart';

class SingleCategory extends StatelessWidget {
  const SingleCategory({super.key, });

  // final int id;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          appBar: CustomAppBar(),
          body: SingleCategoryListView(),
        );
  }
}
