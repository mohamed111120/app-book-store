import 'package:bloc/bloc.dart';
import 'package:book_store/core/services/network/dio_helper.dart';
import 'package:book_store/core/services/network/end_points.dart';
import 'package:book_store/core/utils/widgets/custom_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../home_layout/model/ProductsDetails.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  static FavoritesCubit get(context) => BlocProvider.of(context);

    List<ProductsDetails> favoritesBooks =[];

  void addToFavorites(id) async {
    emit(AddToFavoritesLoading());
    await DioHelper.post(
            url: EndPoints.addToWishlist,
            data: {'product_id': id},
            withToken: true)
        .then((value) {
      showToast(message: value.data['message'], state: ToastState.success);
      emit(AddToFavoritesSuccess());
    }).catchError((e) {
      emit(AddToFavoritesError());
    });
  }

  void showFavorites() async {
    favoritesBooks.clear();
    emit(ShowFavoritesLoading());
    await DioHelper.get(url: EndPoints.wishlist, withToken: true)
        .then((value) {
          for(var i in value.data['data']['data'] ){
            favoritesBooks.add(ProductsDetails.fromJson(i));
          }
          print(favoritesBooks.length);
      emit(ShowFavoritesSuccess());
    }).catchError((e) {
      if(e is DioException){

        print('=============== Dio Exception ==============');
        print(e.response!.data);
      }
      emit(ShowFavoritesError());
    });
  }
}
