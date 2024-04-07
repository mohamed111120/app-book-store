import 'dart:async';
import 'package:book_store/core/services/network/dio_helper.dart';
import 'package:book_store/core/services/network/end_points.dart';
import 'package:book_store/features/single_category/model/single_category_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'single_category_state.dart';

class SingleCategoryCubit extends Cubit<SingleCategoryState> {
  SingleCategoryCubit() : super(SingleCategoryInitial());

  static SingleCategoryCubit get(context) =>
      BlocProvider.of<SingleCategoryCubit>(context);

  List<CategoryProducts>? categoryProducts =[] ;

  Future<void> getCategoryProducts(int id) async {
    categoryProducts = [];
    emit(LoadingGetSingleCategory());
    print(id);
    await DioHelper.get(
      url: '${EndPoints.categories}/$id',
    ).then((value) {
        for (var i in value.data['data']['products']) {
          categoryProducts?.add(
            CategoryProducts.fromJson(i),
          );
        // print(i);
        }
        emit(SuccessGetSingleCategory());
      },
    ).catchError(
      (e) {
        if(e is DioException){
          print('Dio Exception $e');
        }
        print('Exception $e');

        emit(FailedGetSingleCategory());
      },
    );
  }
}

