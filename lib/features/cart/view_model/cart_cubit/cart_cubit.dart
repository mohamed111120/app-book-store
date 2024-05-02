import 'package:bloc/bloc.dart';
import 'package:book_store/core/services/network/dio_helper.dart';
import 'package:book_store/core/services/network/end_points.dart';
import 'package:book_store/features/cart/model/cart_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/widgets/custom_toast.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);
  List<CartModel> cartProducts = [];

  void showCarts() async {
    cartProducts = [];
    emit(ShowCartLoadingState());
    await DioHelper.get(
      url: EndPoints.cart,
      withToken: true,
    ).then((value) {
      for (var i in value.data['data']['cart_items']) {
        cartProducts.add(CartModel.fromJson(i));
      }
      emit(ShowCartSuccessState());
    }).catchError((e) {
      print('======================================');
      print(e);
      if (e is DioException){

        print('======================================');
        print(e.response);
      }
      emit(ShowCartFailedState());
    });
  }

  void addToCart({required int productId}) async {
    emit(AddToCartLoadingState());
    await DioHelper.post(
        url: EndPoints.addToCart,
        withToken: true,
        data: {
    'product_id': productId,
    }
    ).then((value) {
      showToast(message: value.data['message'], state: ToastState.success);
      emit(AddToCartSuccessState());
    }).catchError((e) {
      emit(AddToCartFailedState());
    });
  }

  void updateCart({required int cartItemId,required int quantity,}) async {
    emit(UpdateCartLoadingState());
    await DioHelper.post(
        url: EndPoints.updateCart,
        withToken: true,
        data: {
          'cart_item_id': cartItemId,
          'quantity': quantity,
        }
    ).then((value) {
      showToast(message: value.data['message'], state: ToastState.success);
      showCarts();
      emit(UpdateCartSuccessState());
    }).catchError((e) {
      if(e is DioException){
        showToast(message: e.response?.data['message'], state: ToastState.success);
      }
      emit(UpdateCartFailedState());
    });
  }



}
