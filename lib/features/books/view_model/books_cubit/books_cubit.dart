import 'package:bloc/bloc.dart';
import 'package:book_store/core/services/network/dio_helper.dart';
import 'package:book_store/core/services/network/end_points.dart';
import 'package:book_store/features/favorites/view_model/favorites_cubit/favorites_cubit.dart';
import 'package:book_store/features/home_layout/model/ProductsDetails.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());

  static BooksCubit get(context) => BlocProvider.of<BooksCubit>(context);

  List<ProductsDetails> books = [];
  List<ProductsDetails> searchBooks = [];
  TextEditingController? searchController= TextEditingController();

  void searchFn(String value){
    searchBooks.clear();
    emit(SearchFnLoadingState());
    for(var i in books){
      if(i.name!.trim().toLowerCase().contains(value.trim().toLowerCase())){
        searchBooks.add(i);
      }
    }
    emit(SearchFnSuccessState());
  }

  void getBooks() async {
    emit(GetBooksLoadingState());
    await DioHelper.get(url: EndPoints.books)
        .then((value) {

          for(var i in value.data['data']['products']){
            books.add(ProductsDetails.fromJson(i));
          }
          emit(GetBooksSuccessState());

    })
        .catchError((error) {
          emit(GetBooksErrorState());
    });
  }
}
