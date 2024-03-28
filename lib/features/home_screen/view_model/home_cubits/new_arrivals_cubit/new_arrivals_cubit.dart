import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/network/dio_helper.dart';
import '../../../../../core/services/network/end_points.dart';
import '../../../model/all_prodacts_model/all_products_model.dart';

part 'new_arrivals_state.dart';

class NewArrivalsCubit extends Cubit<NewArrivalsState> {
  NewArrivalsCubit() : super(NewArrivalsInitial());

 static NewArrivalsCubit get(context)=>BlocProvider.of<NewArrivalsCubit>(context);


  List<Products> newArrivalsList = [];

  Future<void> getNewArrivalsProducts() async {
    emit(LoadingGetNewArrivalsState());

    await DioHelper.get(
      url: EndPoints.newArrivals,
    ).then((value) {
      for(var i in value.data['data']['products']){
        newArrivalsList.add(Products.fromJson(i));
      }
      emit(SuccessGetNewArrivalsState());
    }).catchError((e) {
      emit(ErrorGetNewArrivalsState());
    });
  }


}
