import 'package:book_store/core/services/network/dio_helper.dart';
import 'package:book_store/core/services/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/all_prodacts_model/all_products_model.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit() : super(BestSellerInitial());

  static BestSellerCubit get(context) =>
      BlocProvider.of<BestSellerCubit>(context);

  List<Products> bestSellerList = [];

  Future<void> getBestSellerProducts() async {
    emit(LoadingGetBestSellerStatus());

    await DioHelper.get(
      url: EndPoints.bestSeller,
    ).then((value) {
      for(var i in value.data['data']['products']){
      bestSellerList.add(Products.fromJson(i));
      }
      emit(SuccessGetBestSellerStatus());
    }).catchError((e) {
      emit(ErrorGetBestSellerStatus());
    });
  }
}
