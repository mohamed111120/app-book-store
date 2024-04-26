import 'package:book_store/core/utils/app_colors.dart';
import 'package:book_store/core/utils/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_model/books_cubit/books_cubit.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  void initState() {
    if (BooksCubit.get(context).books.isEmpty) {
      BooksCubit.get(context).getBooks();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                SearchBar(
                  controller: BooksCubit.get(context).searchController,
                  backgroundColor: MaterialStatePropertyAll(AppColor.gray),
                  shadowColor: MaterialStatePropertyAll(AppColor.gray),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onChanged: (value) {
                    BooksCubit.get(context).searchFn(value);
                  },
                ),
                BooksCubit.get(context).searchController!.text.trim().isNotEmpty && BooksCubit.get(context).searchBooks.isEmpty ?
                     const Center(
                  child: Text(
                    'No Books With This Name'
                  ),
                )
                    :
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ProductWidget(
                        product: BooksCubit.get(context)
                            .searchController!
                            .text
                            .trim()
                            .isEmpty
                            ? BooksCubit.get(context).books[index]
                            : BooksCubit.get(context).searchBooks[index]);
                  },
                  itemCount: BooksCubit.get(context)
                      .searchController!
                      .text
                      .trim()
                      .isEmpty
                      ? BooksCubit.get(context).books.length
                      : BooksCubit.get(context).searchBooks.length,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
