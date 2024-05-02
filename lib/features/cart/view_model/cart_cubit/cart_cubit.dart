import 'package:bloc/bloc.dart';
import 'package:book_store/core/services/network/dio_helper.dart';
import 'package:book_store/core/services/network/end_points.dart';
import 'package:book_store/features/cart/model/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);
  List<CartModel> cartProducts = [];

  void showCarts() {
    cartProducts = [];
    emit(ShowCartLoadingState());
    DioHelper.get(
      url: EndPoints.cart,
      withToken: true,
    ).then((value) {
      for (var i in value.data['data']['cart_items']) {
        cartProducts.add(CartModel.fromJson(i));
      }
      emit(ShowCartSuccessState());
    }).catchError((e) {
      emit(ShowCartFailedState());
    });
  }
}
