import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_store/core/services/network/dio_helper.dart';
import 'package:book_store/core/services/network/end_points.dart';
import 'package:book_store/features/single_category/model/single_category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'single_category_state.dart';

class SingleCategoryCubit extends Cubit<SingleCategoryState> {
  SingleCategoryCubit() : super(SingleCategoryInitial());

  static SingleCategoryCubit get(context) =>
      BlocProvider.of<SingleCategoryCubit>(context);

  List<CategoryProducts> categoryProducts =[];

  Future<void> getCategory(id) async {
    emit(LoadingGetSingleCategory());
    await DioHelper.get(
      url: '${EndPoints.categories}/$id',
    ).then((value) {

    for(var i in value.data['data']['products'])
    {
      categoryProducts.add(CategoryProducts.fromJson(i));
    }

      emit(SuccessGetSingleCategory());
    },).catchError((e) {
      emit(FailedGetSingleCategory());

    },);
  }
}
